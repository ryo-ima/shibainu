Rails.application.routes.draw do

  post "income_values/new(/:name)" => "income_values#new"
  post "variablecost_values/new(/:name)" => "variablecost_values#new"
  
  get "balance_confirm" => "balance_confirm#top"
	post "balance_confirm/show(/:name)" => "balance_confirm#show"
  post "balance_confirm/show_year(/:name)" => "balance_confirm#show_year"

  resources :variablecost_values
  resources :income_values

  devise_for :users
  root "top#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
