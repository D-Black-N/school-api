Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :admin, only: [:index, :update]
      resources :subject
      resources :teacher
      resources :lesson
      post '/autorize', to: 'admin#autorize'
    end
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
