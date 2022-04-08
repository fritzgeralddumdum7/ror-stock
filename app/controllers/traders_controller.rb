class TradersController < ApplicationController
  def index
    @users = User.where.not(is_admin: 1)
  end
end
