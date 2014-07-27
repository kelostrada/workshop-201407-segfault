class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:user][:email] == 'user@example.com' && params[:user][:password] == 'secretsecret'
      redirect_to questions_path, notice: 'You are now signed-in'
    else
      redirect_to sessions_new_path, alert: 'Bad user/password'
    end
  end
end
