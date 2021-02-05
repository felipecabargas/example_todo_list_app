Rails.application.routes.draw do
  resources :lists do
    resources :tasks
  end

  #type to: 'controller#action'
  root to: 'lists#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
