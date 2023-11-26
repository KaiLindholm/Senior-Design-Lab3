Rails.application.routes.draw do
    root :to => 'pages#index'

    get 'kai' => 'pages#kai'
    get 'james' => 'pages#james'
    get 'joe' => 'pages#joe'
    get 'gustav' => 'pages#gustav'
    
end
