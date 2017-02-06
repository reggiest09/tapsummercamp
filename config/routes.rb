Rails.application.routes.draw do
  devise_for :users, controllers: {:omniauth_callbacks => "omniauth_callbacks"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'product#index'

  resources :taps_programs
resources :subscriptions do
    get 'cancel'
  end
  resources :users, only: [:new, :create]
  resources :pages
  resources :football_steps
  resources :taps_programs
  resources :summer_camps
  resources :early_birds

  get 'football_payment' => 'football_steps#football_payment'
   get 'summer_payment' => 'summer_camps#summer_payment'
   get 'early_payment' => 'early_birds#early_payment'
  
 


end

