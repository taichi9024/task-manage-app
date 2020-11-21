Rails.application.routes.draw do
  namespace :admin do
    resources :users , except:[:edit, :update]
  end
  root 'tasks#index'

  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
