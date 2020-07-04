Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :phones, only: [:index, :create]

  post 'phones/:number', to: 'phones#fancy_number'
end
