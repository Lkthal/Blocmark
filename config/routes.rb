Rails.application.routes.draw do

  resources :topics do
     resources :bookmarks, except: [:index] do
       resources :likes, only: [:index, :create, :destroy]
     end
   end
  root 'welcome#index'
  get 'about' => 'welcome#about'
  devise_for :users
  resources :users, only: [:show]
  post :incoming, to: 'incoming#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
