Rails.application.routes.draw do
  
  devise_for :users
  root 'posts#main_2'

  # Child CRUD - start
  get 'children/new'
  post 'children/create'

  get 'children/index'
  get 'children/show/:id' => 'children#show'
  
  get 'children/edit/:id' => 'children#edit'
  post 'children/update/:id' => 'children#update'

  get 'children/destroy/:id' => 'children#destroy'
  # Child CRUD - end


  # # Record CRUD - start
  get 'records/new/:id' => 'records#new'
  post 'records/create'

  get 'records/index/:id' => 'records#index'
  get 'records/show/:id' => 'records#show'
  
  get 'records/edit/:id' => 'records#edit'
  post 'records/update/:id' => 'records#update'

  get 'records/destroy/:id' => 'records#destroy'
  # # Record CRUD - end

  # Post CRUD -start
  get 'posts/new'
  post 'posts/create'

  get 'posts/index'
  get 'posts/show/:id' => 'posts#show'
  
  get 'posts/edit/:id' => 'posts#edit'
  post 'posts/update/:id' => 'posts#update'

  get 'posts/destroy/:id' => 'posts#destroy'

  # Post CRUD -end 
  post '/tinymce_assets' => 'tinymce_assets#create' #Post 텍스트편집기

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
