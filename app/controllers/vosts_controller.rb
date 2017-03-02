class VostsController < ApplicationController
  before_action :current_user_must_be_vost_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_vost_user
    vost = Vost.find(params[:id])

    unless current_user == vost.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @vosts = Vost.page(params[:page]).per(10)

    render("vosts/index.html.erb")
  end

  def show
    @why = Why.new
    @vost = Vost.find(params[:id])

    render("vosts/show.html.erb")
  end

  def new
    @vost = Vost.new

    render("vosts/new.html.erb")
  end

  def create
    @vost = Vost.new

    @vost.yes_no = params[:yes_no]
    @vost.question_id = params[:question_id]
    @vost.user_id = params[:user_id]

    save_status = @vost.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/vosts/new", "/create_vost"
        redirect_to("/vosts")
      else
        redirect_back(:fallback_location => "/", :notice => "Vost created successfully.")
      end
    else
      render("vosts/new.html.erb")
    end
  end

  def edit
    @vost = Vost.find(params[:id])

    render("vosts/edit.html.erb")
  end

  def update
    @vost = Vost.find(params[:id])

    @vost.yes_no = params[:yes_no]
    @vost.question_id = params[:question_id]
    @vost.user_id = params[:user_id]

    save_status = @vost.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/vosts/#{@vost.id}/edit", "/update_vost"
        redirect_to("/vosts/#{@vost.id}", :notice => "Vost updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Vost updated successfully.")
      end
    else
      render("vosts/edit.html.erb")
    end
  end

  def destroy
    @vost = Vost.find(params[:id])

    @vost.destroy

    if URI(request.referer).path == "/vosts/#{@vost.id}"
      redirect_to("/", :notice => "Vost deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Vost deleted.")
    end
  end
end
