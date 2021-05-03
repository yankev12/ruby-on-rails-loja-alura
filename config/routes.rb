Rails.application.routes.draw do
  delete "produtos/:id/remover", to: "produtos#destroy", as: :produto
  get "produtos/new", to: "produtos#new"
  post "produtos", to: "produtos#create"
  root to: "produtos#index"
end
