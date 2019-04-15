Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :areas
  get "/areas/aj_areas", to: "areas#aj_areas"
end
