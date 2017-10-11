Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'oauth#index'
  get 'oauth/callback', to: 'oauth#callback'
  get 'oauth/authorize', to: 'oauth#authorize'
end
