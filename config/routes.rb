Rails.application.routes.draw do
  root 'sessions#new'

  namespace :admin do
    resources :users , except:[:edit, :update]
  end
  resources :tasks

  get "/login" =>'sessions#new'
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy" 
end
