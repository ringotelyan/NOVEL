Rails.application.routes.draw do

  namespace :public do
    get 'homes/top'
  end
  namespace :public do
    get '/' => 'homes#top'
  end

end
