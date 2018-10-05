class TopsController < ApplicationController
  def index
    require_user_logged_in
  end
end
