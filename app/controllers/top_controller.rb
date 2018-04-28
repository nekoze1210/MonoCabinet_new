class TopController < ApplicationController
  before_action :move_to_items, only: [:welcome]

  def welcome
  end

  def help
  end

  def developer
  end

  def contact
  end

private
  def move_to_items
    redirect_to user_items_path(current_user) if user_signed_in?
  end
end
