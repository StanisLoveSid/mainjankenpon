Rails.application.routes.draw do
  get 'download/index'

  get 'download/zip'

  get 'download/pdf'

  get 'download/doc'
  

devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }


get 'tags/:tag', to: 'lessons#index', as: :tag
 
 get "/messages" => redirect("/conversations")
  resources :messages do
  member do
    post :new
  end
end
resources :conversations do
  member do
    post :reply
    post :trash
    post :untrash
  end
 collection do
    get :trashbin
    post :empty_trash
 end
end

resources :users do
    collection do 
      get 'search'
    end
  end
  resources :comments do
  member { post :vote }
end
  resources :lessons do
   put :favorite, on: :member
    collection do 
      get 'search'
    end
  	member do
  		put "like", to: "lessons#upvote"
  		put "dislike", to: "lessons#downvote"
     put "like", to: "comments#upvote"
      put "dislike", to: "comments#downvote"
  	end
    resources :comments do
      member do 
         put "like", to: "comments#upvote"
      put "dislike", to: "comments#downvote"
    end
  end
  end
  resources :my_models
  
 
  root 'lessons#index'
  get '/download', to: 'download#index'
  get '/tagpages', to: "tagpages#index"
  get "/postuserhistory", to:  "postuserhistory#index"
  get "/userposts", to:  "userposts#index"
  get 'users/:name/lessons' => 'lessons#user_posts', as: :user_lessons
  get '/about', to: 'pages#about'
  get '/likehistory', to: 'likehistory#index'
  get '/users/:id/proba' => 'users#proba'
  get '/users/:id/proba2' => 'users#proba2'
  get '/users/:id/savehero' => 'users#savehero'
  get '/users/:id/test' => 'users#test'
  get '/users/:id/shop' => 'users#shop'
  get '/users/:id/buy' => 'users#buy'
  get '/users/:id/saveresult' => 'users#saveresult'
  get '/users/:id/test' => 'users#test'
  get '/users/:id/shop' => 'users#shop'
  get '/users/:id/buy' => 'users#buy'
  get '/users/:id/hero' => 'users#hero'
  get '/users/:id/changehero' => 'users#changehero'
  get '/users/:id/saveresult' => 'users#saveresult'
  get '/users/:id/addpoints' => 'users#addpoints'
  get '/leaderboard', to: 'leaderboard#index'


  
end
