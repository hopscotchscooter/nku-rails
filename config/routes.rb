NkuRails::Application.routes.draw do
  get 'search' => 'attendances#search'
  
  resources :attendances

  resources :students, except: :edit do
    resources :attendances
  end
  resources :sessions

  get "sign_out", to: "sessions#destroy"
  get "profile", to: "students#edit"

  root to: "sessions#new"
end
