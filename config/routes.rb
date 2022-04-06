Rails.application.routes.draw do
    devise_for :users, :controllers => { :registrations => 'users' }
    devise_scope :user do
        get 'logout' => 'devise/sessions#destroy'
        root :to => 'users#index', :as => :dashboard
        resource :admin
    end
end
