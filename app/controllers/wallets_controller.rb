class WalletsController < ApplicationController
    before_action :action_type, only: [:create]
    before_action :_init, only: [:index, :create]

    def index
        @wallet = Wallet.new
    end

    def create
        @wallet = Wallet.new(wallet_params)

        stock = Stock.find(params[:wallet][:stock_id])
        @wallet.set_action_type(action_type)
        @wallet.set_total_cost(params[:wallet][:qty].to_f * stock.unit_price)

        if @wallet.valid?
            params_obj = params[:wallet].as_json({ except: [:remarks] })
            wallet = Wallet.find_by(:stock_id => params_obj['stock_id'], :user_id => current_user.id)

            begin
                param_qty = params_obj['qty'].to_i
                if wallet
                    if action_type == 'BUY'
                        qty = wallet.qty + param_qty
                        stock.update(qty: stock.qty - param_qty)
                    else
                        stock.update(qty: stock.qty + param_qty)
                        qty = wallet.qty - param_qty
                    end
                else
                    if action_type == 'BUY'
                        stock.update(qty: stock.qty - param_qty)
                    else
                        stock.update(qty: stock.qty + param_qty)
                    end
                    qty = param_qty
                end

                param_total_cost = qty.to_f * stock.unit_price
                
                params_obj = {
                    **params_obj,
                    qty: qty,
                    total_cost: param_total_cost,
                    created_at: Time.now,
                    updated_at: Time.now
                }

                result = Wallet.upsert(params_obj, unique_by: [:user_id, :stock_id])

                if result
                    order = Order.new
                    order.user_id = current_user.id
                    order.stock_id = stock.id
                    order.qty = param_qty
                    order.total_cost = param_qty.to_f * stock.unit_price
                    order.action_type = action_type
                    order.remarks = params[:wallet][:remarks]
                    order.save

                    if action_type == 'BUY'
                        current_user.update(available_cash: current_user.available_cash - params[:wallet][:qty].to_f * stock.unit_price)
                    else
                        current_user.update(available_cash: current_user.available_cash + params[:wallet][:qty].to_f * stock.unit_price)
                    end
                end
            rescue ArgumentError => e
                puts e
            end
            flash.delete(:error)
            redirect_to wallets_path
        else
            if @wallet.errors.any?
                @wallet.errors.each do |err|
                    flash[:error] = err.message
                    break
                end
            end
            @wallet = Wallet.new(wallet_params)
            render :index
        end
    end

    def action_type
        params[:commit]
    end

    def _init
        @wallets = Wallet.where(user_id: current_user.id)
        @stocks = Stock.all
    end

    def wallet_params
        params.require(:wallet).permit(:user_id, :stock_id, :qty)
    end
end
