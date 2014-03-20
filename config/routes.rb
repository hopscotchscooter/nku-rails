NkuRails::Application.routes.draw do
  get 'search' => 'attendances#search'
  post 'assignments/new' => 'assignments#create'
  

  
  resources :students, except: :edit do
    resources :attendances
    resources :assignments
  end
  resources :sessions
  resources :attendances
  resources :assignments
  
  get "sign_out", to: "sessions#destroy"
  get "profile", to: "students#edit"

  root to: "sessions#new"
end
