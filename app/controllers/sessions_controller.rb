class SessionsController < ApplicationController
  skip_before_action :ensure_user_authenticated, only: [:create, :new]

  def new
    redirect_to topics_path if current_user
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      render_error('Wrong name or password')
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to :root
  end

end
