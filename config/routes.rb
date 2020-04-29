Rails.application.routes.draw do

  root 'homes#top'
  get '/about' => 'homes#about'
  get '/search' => 'search#search'
  # お問い合わせフォーム
  get  'index' =>'messages#index'
  post 'confirm' => 'messages#confirm'
  post 'done' => 'messages#done'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :users, only: [:show, :edit, :update, :confirm, :destroy]
  get '/user/confirm' => 'users#confirm'

  resources :idols, only: [:index, :show, :new, :create, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
  end
  resources :places, only: [:index, :show, :new, :create, :edit, :update] do
    resources :place_photos, only: [:show, :new, :create]
    resource :place_comments, only: [:create, :destroy]
    resource :bookmarks, only: [:create, :destroy]
  end
  resources :events do
    resource :event_comments, only: [:create, :destroy]
  end

  # letter_opener用のルーティング
  # mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
