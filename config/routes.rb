Rails.application.routes.draw do
  resources :results
  resources :candidates
  resources :interviews
  mount_devise_token_auth_for 'User', at: 'auth'

  #devise_for :users, controllers: {
  #  sessions: 'users/sessions',
  #  registrations: 'users/registrations'
  #}
  resources :users, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
