Rails.application.routes.draw do

  GamerNow::Application.routes.draw do

    root to: 'home#index'

    devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

    resources :games, :path => 'games'
    resources :news, :path => 'noticias'
    resources :platforms, :path => 'plataformas'
    resources :reviews, :path => 'revisoes'
    resources :videos, :path => 'videos'
    resources :posts, :path => 'posts'
    post 'polls/vote/:id', :to => 'polls#vote'
    get 'polls/results/:id', :to => 'polls#results'
    get 'polls/show/:id', :to => 'polls#show'

    mount Forem::Engine, :at => '/forums'

    namespace :admin do
      root to: 'admin#index'
      resources :adverts
      resources :categories
      resources :channels
      resources :comments
      resources :companies
      resources :features
      resources :games
      resources :genres
      resources :images
      resources :image_comments
      resources :options
      resources :pages
      resources :platforms
      resources :polls
      resources :poll_options
      resources :posts
      resources :post_comments
      resources :slides
      resources :tags
      resources :users
      resources :videos
      resources :video_comments
      get 'api/games', :to => 'rest#games'
    end


    post 'tinymce_assets', :to => 'admin/tinymce_assets#upload'

  end


end
