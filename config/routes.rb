Rails.application.routes.draw do
  root to: 'users#new'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :contacts

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
