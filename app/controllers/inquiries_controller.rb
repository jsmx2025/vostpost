class InquiriesController < ApplicationController
  def index
    @inquiries = Inquiry.page(params[:page]).per(10)

    render("inquiries/index.html.erb")
  end

  def show
    @inquiry = Inquiry.find(params[:id])

    render("inquiries/show.html.erb")
  end

  def new
    @inquiry = Inquiry.new

    render("inquiries/new.html.erb")
  end

  def create
    @inquiry = Inquiry.new

    @inquiry.user_id = params[:user_id]

    save_status = @inquiry.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/inquiries/new", "/create_inquiry"
        redirect_to("/inquiries")
      else
        redirect_back(:fallback_location => "/", :notice => "Inquiry created successfully.")
      end
    else
      render("inquiries/new.html.erb")
    end
  end

  def edit
    @inquiry = Inquiry.find(params[:id])

    render("inquiries/edit.html.erb")
  end

  def update
    @inquiry = Inquiry.find(params[:id])

    @inquiry.user_id = params[:user_id]

    save_status = @inquiry.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/inquiries/#{@inquiry.id}/edit", "/update_inquiry"
        redirect_to("/inquiries/#{@inquiry.id}", :notice => "Inquiry updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Inquiry updated successfully.")
      end
    else
      render("inquiries/edit.html.erb")
    end
  end

  def destroy
    @inquiry = Inquiry.find(params[:id])

    @inquiry.destroy

    if URI(request.referer).path == "/inquiries/#{@inquiry.id}"
      redirect_to("/", :notice => "Inquiry deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Inquiry deleted.")
    end
  end
end
