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
    @whies = @q.result(:distinct => true).includes(:user, :post, :whyvosts, :answer).page(params[:page]).per(10)

    render("whies/index.html.erb")
  end

  def show
    @whyvost = Whyvost.new
    @why = Why.find(params[:id])

    render("whies/show.html.erb")
  end

  def new
    @why = Why.new

    render("whies/new.html.erb")
  end

  def create
    @why = Why.new

    @why.answer_id = params[:answer_id]
    @why.body = params[:body]
    @why.post_id = params[:post_id]
    @why.user_id = params[:user_id]

    save_status = @why.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/whies/new", "/create_why"
        redirect_to("/whies")
      else
        redirect_back(:fallback_location => "/", :notice => "Why created successfully.")
      end
    else
      render("whies/new.html.erb")
    end
  end

  def edit
    @why = Why.find(params[:id])

    render("whies/edit.html.erb")
  end

  def update
    @why = Why.find(params[:id])

    @why.answer_id = params[:answer_id]
    @why.body = params[:body]
    @why.post_id = params[:post_id]
    @why.user_id = params[:user_id]

    save_status = @why.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/whies/#{@why.id}/edit", "/update_why"
        redirect_to("/whies/#{@why.id}", :notice => "Why updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Why updated successfully.")
      end
    else
      render("whies/edit.html.erb")
    end
  end

  def destroy
    @why = Why.find(params[:id])

    @why.destroy

    if URI(request.referer).path == "/whies/#{@why.id}"
      redirect_to("/", :notice => "Why deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Why deleted.")
    end
  end
end
