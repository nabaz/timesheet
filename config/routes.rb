Rails.application.routes.draw do
  resources :time_entries
  resources :tasks
  resources :projects
  resources :customers
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "time_entries/:id/add" => "time_entries#new", as: 'add_time_entry'

end
