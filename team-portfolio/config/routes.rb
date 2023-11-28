Rails.application.routes.draw do
    resources :user, only: %i[new create]
    resources :sessions, only: %i[new create]
    resources :comments, only: %i[create]

    root :to => 'pages#index'

    get 'kai' => 'pages#kai'
    get 'james' => 'pages#james'
    get 'joe' => 'pages#joe'
    get 'gustav' => 'pages#gustav'

    #User Routes
    get 'signup' => 'user#new'
    get 'signup_success' => 'pages#signup_success', as: :signup_success
    get 'logout' => 'sessions#destroy'
    get 'auth/github/callback' => 'sessions#SSO'

    
end
