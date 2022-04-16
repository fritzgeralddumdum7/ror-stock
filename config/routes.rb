Rails.application.routes.draw do
    devise_for :users, :controllers => { :registrations => 'users' }
    devise_scope :user do
        resources :admin do
            resources :traders
        end

        get 'logout' => 'devise/sessions#destroy'
        get 'vTrade' => 'users#v_trade'
        get 'wallets' => 'users#wallets'
        post 'wallets' => 'users#buy'

        root :to => 'users#index', :as => :dashboard
        get 'vTrade', to: 'users#v_trade'
        resources :orders
    end
end
