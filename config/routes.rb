Rails.application.routes.draw do

  get '/ski_makers', to: 'ski_makers#index'
  get '/ski_makers/new', to: 'ski_makers#new'
  post '/ski_makers', to: 'ski_makers#create'
  get '/ski_makers/:id', to: 'ski_makers#show'
  get '/ski_makers/:id/edit', to: 'ski_makers#edit'
  patch '/ski_makers/:id', to: 'ski_makers#update'
  get '/skis', to: 'skis#index'
  get '/skis/:id', to: 'skis#show'
  get '/ski_makers/:id/skis/new', to: 'ski_makers#new_ski'
  get '/ski_makers/:id/skis', to: 'ski_makers#skis'
end
