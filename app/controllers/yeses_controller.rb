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

end

def create_no
 @post = Post.find_by(:id => params[:post_id])

 @no = No.new

 @no.user_id = current_user.id
 @no.post_id = @post.id


   notice = "Vost Made"

  if @post.user_id != current_user.id
    @no.save
  else
    notice = "Can't Vost your own Post brah"
  end

  @yeses = Pick.where(:user_id => current_user.id, :post_id => params[:post_id])
  if @yeses.count > 0
    @yeses.destroy_all
    notice = "Vost Changed"
  end
  redirect_to "/posts#post_#{@post.id}", :notice => notice
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
