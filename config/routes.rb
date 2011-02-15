Surveyor::Application.routes.draw do
  root :to => 'surveys#index'
  resources :surveys
end
