Rails.application.routes.draw do
  root to: 'messages#index'
  resources :user_sessions
  resources :users
  resources :messages

  get :login, to: 'user_sessions#new', as: :login
  delete :logout, to: 'user_sessions#destroy', as: :logout

  resources :users
end
