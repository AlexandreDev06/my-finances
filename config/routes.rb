Rails.application.routes.draw do
  root "home#index"
  get "investment", to: "home#investment"

  devise_for :users
  resources :expenses, except: :show
  resources :credits, except: :show
  resources :future_goals, except: :show
  resources :loans, except: :show
  resources :savings, except: [:show, :destroy]

  get 'reset_value', to: 'home#reset_all', as: 'reset_all_values'
end
