Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :web_addresses, only: [:index] do
    collection do
      post 'generate'
    end

    member do
      get 'stats'
    end
  end

  get '/turl/:token', to: 'punches#punch', as: :punch
  root 'home#index'
end
