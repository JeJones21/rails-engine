Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #option 1 of section 2

  namespace :api do
    namespace :v1 do
      get '/merchants/find', to: 'merchants#find'
      get '/items/find_all_items', to: 'items#find_all_items'
      resources :merchants, only: [:index, :show] do
        resources :items, only: [:index, :show]
      end
      resources :items do
        resources :merchant, only: [:index], controller: 'items/merchants'
      end
      resources :merchants, only: [:index, :show] do
        resources :items, only: [:index], controller: 'merchants/items'
      end
    end
  end
end
