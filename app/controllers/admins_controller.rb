class AdminsController < ApplicationController
    def index
        @users = User.all
    end

    def transactions
        @orders = Order.all.order(id: :desc)
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to admins_path
        else
            render :edit
        end
    end

    def create
        @user = User.new(user_params)
        @user.is_verified = true

        if @user.save
            redirect_to dashboard_path
        else
            if @user.errors.any?
                @user.errors.each do |err|
                    flash[:error] = err.full_message
                    break
                end
            end
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email)
    end
end
