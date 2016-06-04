class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: :destroy

  def new
    @user = User.new
  end

  def create
    @user = login(*login_params.values)
    if @user
      redirect_back_or_to(:users, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end
