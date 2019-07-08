Rails.application.routes.draw do
  devise_for :users
	resources :apidocs, only: [:index]
  resources :articles
 
  namespace :api do
    namespace :v2 do 
      resources :articles
      resources :users
      resources :sessions, only: [:create, :destroy]
      resources :passwords
      post 'passwords/forgot', to: 'passwords#forgot'
      post 'passwords/reset', to: 'passwords#reset'
    end
  end

  # resources :swagger

  # get '/apidocs', to: 'apidocs#swagger_ui',  as: "swagger_ui"
  # root 'apidocs#swagger_ui'
end
