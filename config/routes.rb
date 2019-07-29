Rails.application.routes.draw do
  root to: "analyses#index"
  resources :analyses, only: [:create, :show]
end
