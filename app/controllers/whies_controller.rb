class WhiesController < ApplicationController
  def index
    @whies = Why.all

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
    @why = Why.new

    @why.answer_id = params[:answer_id]
    @why.body = params[:body]
    @why.question_id = params[:question_id]
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
    @why.question_id = params[:question_id]
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