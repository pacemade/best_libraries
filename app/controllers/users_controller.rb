class UsersController < Devise::RegistrationsController

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
