class PostsController < ApplicationController
  before_action :current_user_must_be_post_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_post_user
    post = Post.find(params[:id])

    unless current_user == post.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(:distinct => true).includes(:user, :whies).page(params[:page]).per(10)
    render("posts/index.html.erb")
  end

  def show
    @why = Why.new
    @yes = Pick.new
    @no = No.new
    @post = Post.find(params[:id])

    @user = User.find_by(:id => current_user.id)


    render("posts/show.html.erb")
  end

  def new
    @post = Post.new

    render("posts/new.html.erb")
  end

  def create
    @post = Post.new

    @post.user_id = params[:user_id]
    @post.body = params[:body]

    save_status = @post.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/posts/new", "/create_post"
        redirect_to("/posts")
      else
        redirect_back(:fallback_location => "/", :notice => "Post created successfully.")
      end
    else
      render("posts/new.html.erb")
    end
  end


  def destroy
    @post = Post.find(params[:id])

    @post.destroy

    if URI(request.referer).path == "/posts/#{@post.id}"
      redirect_to("/", :notice => "Post deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Post deleted.")
    end
  end
end
