Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :contacts
  root to: 'users#new'
  resources :feeds do
    collection do
      post :confirm
      resources :sessions, only: [:new, :create, :destroy]
      resources :users
      resources :favorites, only: [:create, :destroy]
    end
  end
end
