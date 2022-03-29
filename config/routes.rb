Rails.application.routes.draw do

  post '/ski_makers/:id/skis', to: 'ski_maker_skis#create'
  get '/ski_makers/:id/skis/new', to: 'ski_maker_skis#new'

  get '/ski_makers', to: 'ski_makers#index'
  get '/ski_makers/new', to: 'ski_makers#new'
  post '/ski_makers', to: 'ski_makers#create'
  get '/ski_makers/:id', to: 'ski_makers#show'
  delete '/ski_makers/:id', to: 'ski_makers#destroy'
  get '/ski_makers/:id/edit', to: 'ski_makers#edit'
  patch '/ski_makers/:id', to: 'ski_makers#update'

  get '/skis/:id/edit', to: 'skis#edit'
  patch '/skis/:id', to: 'skis#update'
  delete '/skis/:id', to: 'skis#destroy'

  get '/skis', to: 'skis#index'
  get '/skis/:id', to: 'skis#show'
  get '/ski_makers/:id/skis', to: 'ski_maker_skis#index'

end
