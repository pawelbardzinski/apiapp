Rails.application.routes.draw do
  devise_for :users
  # Defaulting to the JSON output for the API namespace
  namespace :api, defaults: { format: :json } do
    # Creating namespace for API version 1
    namespace :v1 do
      # Creating users. Full CRUD supported
      resources :users, only: [:show, :create, :update, :destroy] do
          # Defining full REST/CRUD for lists
          resources :lists, controller: 'users/lists' do
            # Within a list we can have many items. We want items to be full CRUD.
            resources :items, controller: 'users/lists/items'
          end
        end
      resources :lists, only: [:show, :index]
      resources :items, only: [:show, :index]

      post "sessions" => "sessions#create"
      delete "sessions" => "sessions#destroy"
    end
  end
end
