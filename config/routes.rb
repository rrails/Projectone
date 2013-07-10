Meeting::Application.routes.draw do
  root :to => 'home#index'
  resources :attendees, :except => [:new, :delete]
  resources :calls

  resources :users, :except => [:edit] do
    collection do
      get 'edit'
    end
  end

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
