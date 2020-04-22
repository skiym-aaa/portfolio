Rails.application.routes.draw do

  root 'homes#top'
  get '/about' => 'homes#about'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :users, only: [:show, :edit, :update, :confirm, :destroy]
  get 'users/confirm' => 'users#confirm'

  resources :idols, only: [:index, :show, :new, :new, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
  end
  resources :places, only: [:index, :show, :new, :new, :edit, :update] do
    resources :pkace_photos, only: [:show, :create]
    resource :bookmarks, only: [:create, :destroy]
  end

end
