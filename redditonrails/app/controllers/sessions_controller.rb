class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login!(@user)
      redirect_to subs_url
    else
      flash[:errors] = ["Invalid credentials"]
      render :new
    end
  end

  def index
  end

  def show
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  def update
  end

  def edit
  end
end
