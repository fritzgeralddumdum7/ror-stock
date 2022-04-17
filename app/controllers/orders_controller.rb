class OrdersController < ApplicationController
    before_action :_init, only: [:index]

    def create
        @order = Order.new(order_params)
        @order.user_id = current_user.id
        @order.action_type = params[:commit]

        if @order.save
            redirect_to vTrade_url
        else
            redirect_to vTrade_url
        end
    end

    def index
        @orders = Order.all.order(id: :desc)
    end

    private

    def order_params
        params.require(:order).permit(:stock_id, :qty)
    end

    def _init
        @wallets = Wallet.all
        @stocks = Stock.all
        @wallet = Wallet.new
    end
end
