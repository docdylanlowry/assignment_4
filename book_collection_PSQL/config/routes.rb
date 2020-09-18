Rails.application.routes.draw do
  
    #get 'books#index'
    resources :books do
        member do
            get :delete
        end
    end

    get 'demo/index'
    get 'demo/hello'
    get 'demo/other_hello'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
