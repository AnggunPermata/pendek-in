Rails.application.routes.draw do
  root "links#index"
  get "/links", to: "links#all"
end
