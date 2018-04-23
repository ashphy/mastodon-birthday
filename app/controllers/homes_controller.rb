# frozen_string_literal: true

class HomesController < ApplicationController
  def index; end

  def create
    current_user.post(home_params[:content])
  end

  private

  def home_params
    params.require(:home).permit(:content)
  end
end
