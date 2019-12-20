Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :contacts
  root to: 'users#new'
  get 'favo_index', to: 'users#favo_index'
  resources :feeds do
    collection do
      post :confirm
      resources :sessions, only: [:new, :create, :destroy]
      resources :users
      resources :favorites
    end
  end
end

# get 'favo_index'　飯田さん箇所
