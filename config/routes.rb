Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'bookmarks/delete'
  get 'lists/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/lists", to: "lists#index"
  get "/lists/new", to: "lists#new", as: :new_list
  post "/lists", to: "lists#create"
  get "/lists/:id", to: "lists#show", as: :list
  get "/lists/:id/edit", to: "bookmarks#edit", as: :edit_bookmark

end
