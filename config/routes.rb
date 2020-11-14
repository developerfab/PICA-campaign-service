Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :campaigns, only: [:index, :create, :show, :update] do
    resources :product_campaigns, only: [:index, :create, :delete]
  end
end
