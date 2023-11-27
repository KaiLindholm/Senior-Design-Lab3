Rails.application.routes.draw do
    resources :user, only: %i[new create]
    resources :sessions, only: %i[new create]

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

    
end
