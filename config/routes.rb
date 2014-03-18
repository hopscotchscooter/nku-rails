NkuRails::Application.routes.draw do
  get 'search' => 'attendances#search'
  
  resources :attendances
  resources :assignments
  
  resources :students, except: :edit do
    resources :attendances
    resources :assignments
  end
  resources :sessions

  get "sign_out", to: "sessions#destroy"
  get "profile", to: "students#edit"

  root to: "sessions#new"
end
