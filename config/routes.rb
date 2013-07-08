Meeting::Application.routes.draw do
  root :to => 'home#index'

resources :users, :calls, :attendees

end
