Rails.application.routes.draw do

<<<<<<< HEAD
  # get 'likes/index'
=======
  get 'likes/index'
>>>>>>> 669c3770873057054b42a379a59b9c57f1e03662
  # get 'bookmarks/show'
  # get 'bookmarks/new'
  # get 'bookmarks/edit'
  resources :topics do
     resources :bookmarks, except: [:index] do
       resources :likes, only: [:index, :create, :destroy]
     end
   end
  root 'welcome#index'
  get 'about' => 'welcome#about'
  devise_for :users
  post :incoming, to: 'incoming#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
