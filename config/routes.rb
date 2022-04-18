Rails.application.routes.draw do
  namespace :v1 do
    resources :contacts do
      get 'showmodal', to: 'contacts#showmodal'
    end
    resources :users do
      get 'showmodal', to: 'users#showmodal'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
