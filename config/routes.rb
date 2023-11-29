Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "today", to: "pages#today", as: :today
  patch "/looks/:id/reject", to: "looks#reject", as: :reject
  patch "/looks/:id/favorite", to: "looks#favorite", as: :favorite
  # get "/outfits/:id", to: "looks#explore", as: :explore

  get "/favorites", to: "looks#favorites", as: :favorites

  get "/pieces", to: "pages#pieces", as: :pieces

  get "/outfits/:id", to: "outfits#show", as: :outfit
end
