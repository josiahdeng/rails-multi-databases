Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "blog#index"

  resources :blog

  namespace :writer do
    resources :writer
  end
end
