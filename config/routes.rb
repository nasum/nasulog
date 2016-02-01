Rails.application.routes.draw do
  get  '/auth/:provider/callback', to:'sessions#callback'
  post '/auth/:provider/callback', to: 'sessions#callback'
  get  '/auth/failure' => 'sessions#failure'
  get  '/logout' => 'sessions#destroy'

  resources :home
  resources :poems, shallow: true do
    resources :read_poems, only: [:create, :destroy]
  end
  resources :read_poems, only: [:index]
  resource :user, only: [:show, :edit, :update]
  root to: 'home#index'

  namespace :api do
    resources :emoji, only: [:index]
    resources :markdown_previews, only: [:create]
    resources :poems, only: [:index, :show, :create, :update, :destroy], defaults: { format: :json }, shallow: true do
      resources :read_poems, only: [:create, :destroy], defaults: { format: :json }
    end
    resource :user, only: [:show], defaults: { format: :json } do
      get 'poems', defaults: { format: :json }, to: 'user_poems#index'
    end
  end
end
