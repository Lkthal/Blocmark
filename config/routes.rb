Rails.application.routes.draw do

  # get 'bookmarks/show'
  # get 'bookmarks/new'
  # get 'bookmarks/edit'
  resources :topics do
     resources :bookmarks, except: [:index]
   end
  root 'welcome#index'
  get 'about' => 'welcome#about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
