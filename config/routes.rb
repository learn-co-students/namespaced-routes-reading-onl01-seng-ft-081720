Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]
  root 'posts#index'
  # get '/stats', to: 'stats#index'
  # modified to only be seen by the admin
  # get '/admin/stats', to: 'stats#index'
  # but once we have many routes it gets messy so this is cleaner and less repeative
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end
  # above is great but still not dry
  # when we want to use route with a module and use that modules name as the URL prefix
  # use namespace method instead of scope
  namespace :admin do
    resources :stats, only: [:index]
  end
  # The namespace method makes the assumption that the path prefix and module name match, saving us some typing.
  


  

  


end
