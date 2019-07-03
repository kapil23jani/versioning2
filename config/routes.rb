Rails.application.routes.draw do
	resources :apidocs, only: [:index]
  resources :articles
 
  namespace :api do
    namespace :v2 do 
      resources :articles
    end
  end
end
