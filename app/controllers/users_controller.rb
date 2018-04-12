class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash.now[:alert] = @user.errors.full_messages
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @on_loan = @user.borrows.on_loan
    @returned = @user.borrows.returns
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
