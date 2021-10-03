Rails.application.routes.draw do
  root "home#index"

  resources :expenses, except: :show
  resources :credits, except: :show
  resources :future_goals, except: :show
end
