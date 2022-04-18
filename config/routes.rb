Rails.application.routes.draw do
    devise_for :users, :controllers => { :registrations => 'users' }
    devise_scope :user do
        # resources :admin do
        #     resources :traders
        # end

        get 'admin/user-list' => 'admins#index'

        get 'logout' => 'devise/sessions#destroy'
        get 'vTrade' => 'users#v_trade'

        root :to => 'users#index', :as => :dashboard
        resources :orders
        resources :wallets
    end
    get 'vTrade', to: 'users#v_trade'
end
