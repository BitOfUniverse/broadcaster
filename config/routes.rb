Rails.application.routes.draw do
  devise_for :users

  get '/watch/:id', to: 'users#watch', as: :watch
  get '/stream', to: 'users#stream', as: :stream

  root 'users#stream'
end
