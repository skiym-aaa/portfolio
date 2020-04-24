Rails.application.routes.draw do

  root 'homes#top'
  get '/about' => 'homes#about'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :users, only: [:show, :edit, :update, :confirm, :destroy]
  get '/user/confirm' => 'users#confirm'

  resources :idols, only: [:index, :show, :new, :create, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
  end
  resources :places, only: [:index, :show, :new, :create, :edit, :update] do
    resources :place_photos, only: [:show, :create]
    resource :bookmarks, only: [:create, :destroy]
  end
  resources :events do
    resource :event_comments, only: [:create, :destroy]
  end

end
