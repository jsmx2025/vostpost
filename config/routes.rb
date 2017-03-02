Rails.application.routes.draw do
  # Routes for the Post resource:
  # CREATE
  get "/posts/new", :controller => "posts", :action => "new"
  post "/create_post", :controller => "posts", :action => "create"

  # READ
  get "/posts", :controller => "posts", :action => "index"
  get "/posts/:id", :controller => "posts", :action => "show"

  # UPDATE
  get "/posts/:id/edit", :controller => "posts", :action => "edit"
  post "/update_post/:id", :controller => "posts", :action => "update"

  # DELETE
  get "/delete_post/:id", :controller => "posts", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
