class SessionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    user = User.find_by(login: params[:login])
    if user && user.authenticate(params[:password])
      #sign_in user
      session[:user_id] = user.id
      redirect_to tasks_input_path
    else
      render 'new'
    end
  end

  def destroy
    #sign_out
    session[:user_id] = nil
    redirect_to root_url
  end
end
