Rails.application.routes.draw do

    resources :users, only: [:index, :destroy, :update]
    post "/signup", to: "users#create"
    get "/me", to: "users#show"

    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    patch "/party_games/:id/current-game", to: "party_games#current_game"
    resources :party_game
    

    resources :game, only: [:show, :create, :destroy]
    
    resources :party_game_game, only: [:index, :destroy, :update]

    resources :tracker, only: [:show, :create, :update, :destroy]

    resources :helpme, only: [:show, :create, :update, :destroy]

    resources :comments, only: [:create, :destroy]
    
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
