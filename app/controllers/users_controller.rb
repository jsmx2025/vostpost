class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @why = Why.new
    @yes = Pick.new
    @no = No.new
  end
end
