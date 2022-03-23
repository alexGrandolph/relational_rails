Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/ski_makers', to: 'ski_makers#index'
  get '/ski_makers/:id', to: 'ski_makers#show'
  get '/skis', to: 'skis#index'
end
