class WalletsController < ApplicationController
    def create
        wallet = Wallet.upsert(wallet_params, unique_by: [:user_id, :stock_id])
        if wallet
            redirect_to vTrade_url
        else
            redirect_to vTrade_url
        end
    end

    def wallet_params
        params_obj = eval(params.require(:wallet).permit!.to_s)
        stock = Stock.find(params_obj['stock_id'])

        {
            user_id: current_user.id,
            stock_id: stock.id,
            qty: params_obj['qty'],
            total_cost: params_obj['qty'].to_f * stock.unit_price,
            created_at: Time.now,
            updated_at: Time.now
        }
    end
end
