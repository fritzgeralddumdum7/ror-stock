class UsersController < Devise::RegistrationsController
    def create
        @user = User.new(user_params)

        if @user.save

            redirect_to dashboard_path
        else
            render 'devise/registrations/new'
        end
    end

    def wallets
    end

    def buy
        action = 'BUY'
        @order = Order.new(order_params)

        if @order.save
            redirect_to dashboard_path
        else
            render :v_trade
        end
    end

    def v_trade
        @stocks = Stock.all
        @wallets = Wallet.all
        @wallet = Wallet.new
    end
    def new
        @user = User.new
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
