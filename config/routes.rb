Rails.application.routes.draw do
  # delete "produtos/:id/remover", to: "produtos#destroy", as: :produto
  # get "produtos/new", to: "produtos#new"
  # post "produtos", to: "produtos#create"
  get "produtos/busca", to: "produtos#busca", as: :busca_produto
  resources :produtos, only: [:new, :create, :destroy]
  root to: "produtos#index"
end
