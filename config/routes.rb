Meeting::Application.routes.draw do
  root :to => 'calls#index'

resources :users, :calls, :attendes

end
