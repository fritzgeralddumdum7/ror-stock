class AdminsController < ApplicationController
    def index
        @users = User.all
    end

    def transactions
        @orders = Order.all.order(id: :desc)
    end
end
