NkuRails::Application.routes.draw do
  get 'search' => 'attendances#search'
  
  resources :attendances
  
  resources :posts do
    resources :comments
  end

  resources :students, except: :edit
  resources :sessions

  get "sign_out", to: "sessions#destroy"
  get "profile", to: "students#edit"

  root to: "students#index"
end
