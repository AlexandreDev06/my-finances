Rails.application.routes.draw do
  root "home#index"
  get "investment", to: "home#investment"

  devise_for :users
  resources :expenses, except: :show
  resources :credits, except: :show
  resources :future_goals, except: :show
  resources :loans, except: :show
  resources :savings, except: [:show, :destroy]
end
