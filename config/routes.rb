Rails.application.routes.draw do

  resources :topics do
 # #34
     #resources :bookmarks, except: [:index]
   end
  root 'welcome#index'
  get 'about' => 'welcome#about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
