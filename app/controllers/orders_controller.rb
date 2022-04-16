class OrdersController < ApplicationController
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

    private

    def order_params
        params.require(:order).permit(:stock_id, :qty)
    end
end
