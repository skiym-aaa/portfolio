Rails.application.routes.draw do

  root 'homes#top'
  get '/about' => 'homes#about'
  get '/search' => 'search#search'
  # お問い合わせフォーム
  get  '/contact/index' =>'messages#index'
  post '/contact/confirm' => 'messages#confirm'
  post '/contact/done' => 'messages#done'
  # チャットルーム
  resources :rooms, only: [:index, :create, :show]

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :omniauth_callbacks => 'users/omniauth_callbacks'
   }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :users, only: [:show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    # get '/follows' => 'relationships#follower', as: 'follows'
    # get '/followers' => 'relationships#followed', as: 'followers'
  end
  get '/users/:id/timeline' => 'users#timeline', as: 'user_timeline'
  get '/user/confirm' => 'users#confirm'
  # 退会用のアクション
  put '/users/:id/hide' => 'users#hide', as: 'user_hide'

  resources :idols, only: [:index, :show, :new, :create, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    delete '/ajax_favorites' => 'favorites#ajax_destroy'
    post '/ajax_favorites' => 'favorites#ajax_create'
  end
  resources :places, only: [:index, :show, :new, :create, :edit, :update] do
    resources :place_photos, only: [:show, :new, :create]
    resource :place_comments, only: [:create, :destroy]
    resource :bookmarks, only: [:create, :destroy]
    delete '/ajax_bookmarks' => 'bookmarks#ajax_destroy'
    post '/ajax_bookmarks' => 'bookmarks#ajax_create'
  end
  resources :events do
    resources :event_photos, only: [:show, :new, :create] do
      resource :goods, only: [:create, :destroy]
    end
    resource :event_comments, only: [:create, :destroy]
    resource :event_registers, only: [:create, :destroy]
  end

  # letter_opener用のルーティング
  # mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
