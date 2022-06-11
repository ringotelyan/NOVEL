Rails.application.routes.draw do

  # 顧客用
  # skipは不要なルーティングを削除
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # deviseに新たにルーティングを追加（スコープを経由）（ゲストログイン機能）
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#new_guest'
  end

  # 管理者
  # skipは不要なルーティングを削除
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :public, path: "" do
    get '/' => "homes#top"
    get '/about' => 'homes#about'
    resources :novels do
      # 1人のユーザーは1つの投稿に対して1回しか良いね出来ない→resourceを使ってURLに[:id]を含めない
      resource :favorites, only: [:create, :destroy]
      resources :novel_comments, only: [:create, :destroy]
    end
    resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
