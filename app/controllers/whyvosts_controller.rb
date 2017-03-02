class WhyvostsController < ApplicationController
  def index
    @q = Whyvost.ransack(params[:q])
    @whyvosts = @q.result(:distinct => true).includes(:why, :user).page(params[:page]).per(10)

    render("whyvosts/index.html.erb")
  end

  def show
    @whyvost = Whyvost.find(params[:id])

    render("whyvosts/show.html.erb")
  end

  def new
    @whyvost = Whyvost.new

    render("whyvosts/new.html.erb")
  end

  def create
    @whyvost = Whyvost.new

    @whyvost.response = params[:response]
    @whyvost.why_id = params[:why_id]

    save_status = @whyvost.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/whyvosts/new", "/create_whyvost"
        redirect_to("/whyvosts")
      else
        redirect_back(:fallback_location => "/", :notice => "Whyvost created successfully.")
      end
    else
      render("whyvosts/new.html.erb")
    end
  end

  def edit
    @whyvost = Whyvost.find(params[:id])

    render("whyvosts/edit.html.erb")
  end

  def update
    @whyvost = Whyvost.find(params[:id])

    @whyvost.response = params[:response]
    @whyvost.why_id = params[:why_id]

    save_status = @whyvost.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/whyvosts/#{@whyvost.id}/edit", "/update_whyvost"
        redirect_to("/whyvosts/#{@whyvost.id}", :notice => "Whyvost updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Whyvost updated successfully.")
      end
    else
      render("whyvosts/edit.html.erb")
    end
  end

  def destroy
    @whyvost = Whyvost.find(params[:id])

    @whyvost.destroy

    if URI(request.referer).path == "/whyvosts/#{@whyvost.id}"
      redirect_to("/", :notice => "Whyvost deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Whyvost deleted.")
    end
  end
end
