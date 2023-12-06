Rails.application.routes.draw do
  devise_for :users
  root to: "pages#today"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "today", to: "pages#today", as: :today
  get "/looks/:id/reject", to: "looks#reject", as: :reject
  patch "/looks/:id/favorite", to: "looks#favorite", as: :favorite
  patch "looks/:id/unfavorite", to: "looks#unfavorite", as: :unfavorite
  get "/looks/:id/explore", to: 'looks#explore', as: :explore_look

  get "/looks/favorites", to: "looks#favorites", as: :favorites

  get "/pieces", to: "pages#pieces", as: :pieces
  get "/generate", to: "pages#generate", as: :generate

  get "/outfits/new", to: "outfits#new"
  get "outfits/index", to: "outfits#index", as: :outfits
  get "/outfits/:id", to: "outfits#show", as: :outfit

  get "/statistics", to: "pages#statistics", as: :statistics
  # resources :looks, only: :show do
  #   # collection do
  #   #   get :generate_looks
  #   # end
  #   resources :outfits, only: :create
  # end

  post "/outfits/create", to: "outfits#create", as: :create_outfit
end
