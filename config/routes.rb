Rails.application.routes.draw do
  devise_for :users
  get "home/investments"
  root "home#index"

  resources :expenses, except: :show
  resources :credits, except: :show
  resources :future_goals, except: :show
  resources :loans, except: :show
  resources :savings, except: [:show, :destroy]
end
