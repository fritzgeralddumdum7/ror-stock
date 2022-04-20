Rails.application.routes.draw do
    devise_for :users, :controllers => {
        :registrations => 'users'
    }
    devise_scope :user do
        get 'admin/user-list' => 'admins#index'
        get 'logout' => 'devise/sessions#destroy'
        get 'login' => 'devise/sessions#new'
        get 'orders' => 'orders#index'
        get 'stocks' => 'stocks#index'
        get 'wallets'=> 'wallets#index'
        post 'wallets'=> 'wallets#create'

        get 'transactions'=> 'admins#transactions'

        root :to => 'wallets#index', :as => :dashboard
    end
end
