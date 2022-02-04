Rails.application.routes.draw do
  

  root "links#index"
  get "/links", to: "links#all"
  get "/links/new", to: "links#new"
  post "/links", to: "links#create"
  delete 'links/:id', to: 'links#destroy'
  resources :links, only: [:edit, :update, :destory, :show]
end
