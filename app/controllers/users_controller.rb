class UsersController < Devise::RegistrationsController
    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to dashboard_path
        else
            render 'devise/registrations/new'
        end
    end

    def login
        byebug
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
