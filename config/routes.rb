Rails.application.routes.draw do
 get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#landing_page'
  get '/admin' => 'static#admin_index'
  resources :users, :images, :blog_posts, :headlines
end
