class WhiesController < ApplicationController
  before_action :current_user_must_be_why_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_why_user
    why = Why.find(params[:id])

    unless current_user == why.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Why.ransack(params[:q])
    @whies = @q.result(:distinct => true).includes(:user, :post, :pick, :no).page(params[:page]).per(10)

    render("whies/index.html.erb")
  end

  def show
    @why = Why.find(params[:id])

    render("whies/show.html.erb")
  end

  def new
    @why = Why.new

    render("whies/new.html.erb")
  end

  def create
    @post = Post.find_by(:id => params[:post_id])
    @why = Why.new

    @why.user_id = params[:user_id]
    @why.post_id = params[:post_id]
    @why.response = params[:response]

    notice = "Comment Made"

    if @post.user != current_user
    @why.save
    else
      notice = "Can't Comment on your own Post brah."
    end

    redirect_to "/posts#post_#{@post.id}", :notice => notice
  end

  # def edit
  #   @why = Why.find(params[:id])
  #
  #   render("whies/edit.html.erb")
  # end
  #
  # def update
  #   @why = Why.find(params[:id])
  #   @why.post_id = params[:post_id]
  #   @why.response = params[:response]
  #
  #   save_status = @why.save
  #
  #   if save_status == true
  #     referer = URI(request.referer).path
  #
  #     case referer
  #     when "/whies/#{@why.id}/edit", "/update_why"
  #       redirect_to("/whies/#{@why.id}", :notice => "Why updated successfully.")
  #     else
  #       redirect_back(:fallback_location => "/", :notice => "Why updated successfully.")
  #     end
  #   else
  #     render("whies/edit.html.erb")
  #   end
  # end

  def destroy
    @post = Post.find_by(:id => params[:post_id])
    @why = Why.find(params[:id])

    @why.destroy

    if URI(request.referer).path == "/whies/#{@why.id}"
      redirect_to("/posts#why_#{@why.id}", :notice => "Why deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Why deleted.")
    end
  end
end
