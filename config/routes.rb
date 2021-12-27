Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      post '/autorize', to: 'admin#autorize'
      get '/subjects', to: 'admin#subjects'
      get '/teachers', to: 'admin#teachers'
    end
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
