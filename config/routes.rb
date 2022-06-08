Rails.application.routes.draw do

  # 顧客用
  # skipは不要なルーティングを削除
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

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
      resources :novel_comments, only: [:create]
    end
    resources :users, only: [:index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
