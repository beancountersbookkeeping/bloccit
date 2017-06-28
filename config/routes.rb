Rails.application.routes.draw do

  resources :questions
  resources :advertisements

 Rails.application.routes.draw do
  resources :topics do 
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end
end

   resources :posts, only: [] do
     resources :comments, only: [:create, :destroy]
   end
  
  resources :users, only: [:new, :create]
  post 'users/confirm' => 'users#confirm'
  
  resources :sessions, only: [:new, :create, :destroy]

  get 'about' => 'welcome#about'
  
  get 'welcome/faq'
  
  root 'welcome#index'
end