Rails.application.routes.draw do
  get 'punches/punch'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :web_addresses, only: [:index] do
    collection do
      post 'generate'
    end
  end

  get '/turl/:token', to: 'punches#punch', as: :punch

  root 'home#index'
end
