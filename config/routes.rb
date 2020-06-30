Rails.application.routes.draw do
  devise_for :users, controller: {session: "user_session"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "blog#index"

  resources :blog do
    collection do
      get :test_mustache
    end
  end

  resources :category

  namespace :writer do
    resources :writer
  end
end
