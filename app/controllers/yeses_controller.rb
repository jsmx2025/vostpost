class YesesController < ApplicationController

def index
  @yes = Pick.all
  @no = No.all
end

def show
  @yes = Pick.find(params[:id])
  @no = No.find(params[:id])
end

def new_yes
  @yes = Pick.new
end

def new_no
  @no = No.new
end

def create_yes
  @post = Post.find_by(:id => params[:post_id])
  @yes = Pick.new


  @yes.user_id = current_user.id
  # @yes.user_id = params[:user_id]
  @yes.post_id = @post.id

  notice = "Vost made"

  if @post.user != current_user
    @yes.save
  else
    notice = "Can't vost your own post brah"
  end

  @nos = No.where(:user_id => current_user.id, :post_id => params[:post_id])
  if @nos.count > 0
    @nos.destroy_all
    notice = 'Vost changed'
  end
  # save the yes
  # destroy any no's
  # redirect
  redirect_to  "/posts#post_#{@post.id}", :notice => notice



  # @no = No.find_by(params[:post_id], :conditions => {:user_id => current_user.id})
  #
  # if current_user.id == @yes.post.id
  #   save_status = nil
  #   redirect_to :back, :notice => "Can't Vost your own Post brah."
  # elsif @no == nil && @yes == nil
  #   save_status = @yes.save
  #   redirect_to("/", :notice => "Vost Made.")
  # elsif @yes != nil && @no != nil
  #   @no.destroy
  #   save_status = @yes.save
  #   redirect_to :back, :notice => "Vost Made."
  # elsif @no != nil
  #   save_status = @yes.save
  #   @no.destroy
  #   redirect_to :back, :notice => "Vost Changed."
  # else
  #   save_status = @yes.save
  #   redirect_to :back, :notice => "Vost Changed"
  # end
end

def create_no
 @post = Post.find_by(:id => params[:post_id])

 @no = No.new

 @no.user_id = current_user.id
 @no.post_id = params[:post_id]

  # @yes = Pick.find_by(:post_id => params[:post_id], :user_id => current_user.id)
   notice = "Vost Made"

  if @post.user_id != current_user.id
    @no.save
  else
    notice = "Can't Vost your own Post brah"
  end

  @yeses = Pick.where(:user_id => current_user.id, :post_id => params[:post_id])
  if @yeses.count > 0
    @yeses.destroy_all
  else
    notice = "Vost Changed"
  end
  redirect_to "/posts#post_#{@post.id}", :notice => notice



  # if current_user.id == @no.post.id
  #   save_status = nil
  #   redirect_to :back, :notice => "Can't Vost your own Post brah."
  # elsif @no == nil && @yes == nil
  #   save_status = @no.save
  #   redirect_to("/", :notice => "Vost Made.")
  # elsif @no != nil && @yes != nil
  #   @yes.destroy
  #   save_status = @no.save
  #   redirect_to :back, :notice => "Vost Made."
  # elsif @yes != nil
  #   @yes.destroy
  #   save_status = @no.save
  #   redirect_to :back, :notice => "Vost Changed."
  # else
  #   save_status = @no.save
  #   redirect_to :back, :notice => "Vost Changed"
  # end
end


  def destroy
    @yes = Pick.find_by(params[:id])
    @yes.destroy

    @no = No.find_by(params[:id])
    @no.destroy


    if URI(request.referer).path == "/yes/#{@yes.id}"
      redirect_to :back, :notice => "Vost Changed."
    else
      redirect_back(:fallback_location => "/", :notice => "Vost Changed.")
    end
  end
end
    #
    # if save_status == true
    #   referer = URI(request.referer).path
    #
    #   case referer
    #   when "/yes/new", "/create_yes"
    #     redirect_to("/")
    #   else
    #     redirect_back(:fallback_location => "/", :notice => "Vost created successfully.")
    #   end
    # else
    #   render("/")
    # end
