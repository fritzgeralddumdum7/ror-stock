class WalletsController < ApplicationController
    before_action :action_type, only: [:create]
    before_action :_init, only: [:index, :create]


    def index
        @wallet = Wallet.new
    end

    def create
        @wallet = Wallet.new(wallet_params)
        @wallet.set_action_type(action_type)

        if @wallet.valid?
            params_obj = params[:wallet].as_json({ except: [:remark] })
            stock = Stock.find(params_obj['stock_id'])
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
                
                params_obj = {
                    **params_obj,
                    user_id: current_user.id,
                    qty: qty,
                    total_cost: qty.to_f * stock.unit_price,
                    created_at: Time.now,
                    updated_at: Time.now
                }

                Wallet.upsert(params_obj, unique_by: [:user_id, :stock_id])
            rescue ArgumentError => e
                p e
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
        @wallets = Wallet.all
        @stocks = Stock.all
    end

    def wallet_params
        params.require(:wallet).permit(:stock_id, :qty)
    end
end
