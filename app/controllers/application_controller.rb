# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # helper_method :current_user, :logged_in?

  private

  # def current_user
  #   Rails.logger.debug "current_user #{session['devise.mastodon_data']}"
  #   return unless session['devise.mastodon_data']
  #   @current_user ||= User.find(session[:user_id])
  # end
  #
  # def logged_in?
  #   !!session[:user_id]
  # end
  #
  # def authenticate
  #   return if logged_in?
  #   redirect_to root_path, alert: 'ログインしてください'
  # end
end
