Rails.application.routes.draw do


  

  devise_for :providers, controllers: {
    sessions: 'providers/sessions',
    passwords: 'providers/passwords',
    registrations: 'providers/registrations',
    invitations: 'providers/invitations'
  }
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        invitations: 'users/invitations'
      }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get 'registrations/:id/edit_password', to: 'registrations#edit_password', as: 'edit_password'
    put 'registrations/:id/update_password', to: 'registrations#update_password', as: 'update_password'
  end

  devise_scope :provider do
    get '/providers/sign_out' => 'devise/sessions#destroy'
  end

    
  root "tops#index"
  get "tops/index",to:"tops#index"
  get "tops/news",to:"tops#news"
  get "tops/news/:id",to:"tops#newsshow"
  get "tops/policy",to:"tops#policy"
  get "tops/terms",to:"tops#terms"
  get "tops/addprovidercomp",to:"tops#addprovidercomp"
  get "tops/destroycomp",to: "tops#destroycomp"

  resources :works do
    member do
      get :move_top
      get :move_higher
      get :move_lower
      get :move_bottom
    end
    resources :introductions, only: [:create, :edit, :update]
    resources :details, only: [:create]
    resources :work_providers, only: [:create]
  end


  resources :news
  resources :questions
  

  get "posts/index",to:"posts#index"
  get "posts/:id",to:"posts#show"
  get "works/:id/introductions/new", to:"introductions#new"
  get "works/:id/introductions/edit", to:"introductions#edit"
  get "works/:id/work_providers/index", to:"work_providers#index"
  get "works/:id/work_providers/new", to:"work_providers#new"
  post "works/:id/work_providers", to:"work_providers#create"
  get "introductions/complete", to:"introductions#complete"

  get "works/:id/details/new", to:"details#new"

  resources :details

  get "works/:id/introductions", to:"introductions#index"
  get "works/:id/introductions/:id", to:"introductions#show"




  get "introductions/index", to:"introductions#index"
  get "introductions/:id", to:"introductions#show"
  get "introductions/:id/edit", to:"introductions#edit"

  

 resources :introductions do
    resources :progresses, only: [:create, :edit, :update, :show]
  end
  get "introductions/:id/progresses",to:"progresses#new"
  get "progresses/index",to:"progresses#index"
  get "progresses/:id",to:"progresses#show"
  get "progresses/news",to:"progresses#news"

  get "users/index",to:"users#index"
  get "users/:id",to:"users#show"
  
  get "users/complete/:id",to:"users#complete"
  get "users/mypage/:id",to:"users#mypage"
  get "users/destroy/:id",to:"users#destroy"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
