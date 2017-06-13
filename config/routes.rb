Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show] do
    resources :shopping_lists
  end

  resources :test_recipes
  resources :ingredient_amounts
  resources :ingredients do
    resources :specialty_purchase_destinations
  end
  resources :shopping_list_test_recipes


  root 'pages#show'
end
