Rails.application.routes.draw do
  resources :powers, only: [:show, :index,:update]
  resources :hero_powers, only: [:create]
  get '/heros', to: "heros#index"
  get '/heros/:id', to: "heros#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
