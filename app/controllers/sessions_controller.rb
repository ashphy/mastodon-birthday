# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    logger.info request.env['omniauth.auth']
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
