Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :admin, only: [:update]
      resources :subject, only: [:index, :create, :update, :destroy]
      resources :teacher, only: [:index, :create, :update, :destroy]
      resources :lesson, only: [:index, :create, :update, :destroy]
      post '/autorize', to: 'admin#autorize'
    end
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
