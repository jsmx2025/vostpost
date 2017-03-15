# class NosController < ApplicationController
#
#   def index
#     @no = No.all
#   end
#
#   def show
#     @no = No.find(params[:id])
#   end
#
#   def new_no
#     @no = No.new
#   end
#
#
#   def create
#     @no = No.new
#     @fig = Pick.all
#     @yes = @fig.find_by(params[:post_id])
#
#     @no.user_id = params[:user_id]
#     @no.post_id = params[:post_id]
#
#
#     if @yes == nil
#     save_status = @no.save
#     redirect_to("/posts", :notice => "Vost Made.")
#     end
#
#     if @yes != nil
#       save_status = @no.save
#       @yes.destroy
#       redirect_to "/posts", :notice => "Vost Changed."
#     end
#
#     if current_user.id == @no.post.id
#     save_status = nil
#     redirect_to("/posts", :notice => "Can't Vost your own Post brah.")
#   end
#   end
#
#
#     def destroy
#       @no = No.find_by(params[:id])
#
#
#       @no.destroy
#
#       if URI(request.referer).path == "/no/#{@no.id}"
#         redirect_to :back, :notice => "Vost Changed."
#       else
#         redirect_back(:fallback_location => "/", :notice => "Vost Changed.")
#       end
#   end
# end
