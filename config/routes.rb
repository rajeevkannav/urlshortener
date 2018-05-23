Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :web_addresses, only: [] do
    collection do
      post 'generate'
    end
  end

  root 'home#index'
end
