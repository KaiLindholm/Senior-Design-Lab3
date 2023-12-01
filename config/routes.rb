Rails.application.routes.draw do
    resources :user, only: %i[new create]
    resources :projects, only: %i[show]
    resources :sessions, only: %i[new create]
    resources :comments, only: %i[new create destroy]

    root :to => 'pages#index'

    get 'kai' => 'pages#kai', as: :kai
    get 'james' => 'pages#james', as: :james
    get 'joe' => 'pages#joe', as: :joe
    get 'gustav' => 'pages#gustav', as: :gustav
    
    #User Routes
    get 'signup' => 'user#new'
    get 'signup_success' => 'pages#signup_success', as: :signup_success
    get 'logout' => 'sessions#destroy'
    get 'auth/github/callback' => 'sessions#SSO'

    #Comment Routes
    post '/comments', to: 'comments#create', as: 'create_comment'    
end
