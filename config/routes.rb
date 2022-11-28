Rails.application.routes.draw do
  resources :games
  resources :game_questions
  resources :trackers
  resources :comments
  resources :party_game_users
  resources :party_game_games
  resources :party_games
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
