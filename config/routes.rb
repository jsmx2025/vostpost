Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)

  # Routes for the Whyvost resource:
  root :to => "posts#index"

  # Routes for the Vost resource:
  # CREATE
  get "/yes/new", :controller => "yeses", :action => "new_yes"
  post "/create_yes", :controller => "yeses", :action => "create_yes"

  get "/no/new", :controller => "nos", :action => "new_no"
  post "/create_no", :controller => "yeses", :action => "create_no"
  
  # DELETE
  get "/delete_yes/:id", :controller => "yeses", :action => "destroy"
  get "/delete_no/:id", :controller => "yeses", :action => "destroy"
  #------------------------------

  # Routes for the Why resource:
  # CREATE
  get "/whies/new", :controller => "whies", :action => "new"
  post "/create_why", :controller => "whies", :action => "create"

  # READ
  get "/whies", :controller => "whies", :action => "index"
  get "/whies/:id", :controller => "whies", :action => "show"

  # UPDATE
  get "/whies/:id/edit", :controller => "whies", :action => "edit"
  post "/update_why/:id", :controller => "whies", :action => "update"

  # DELETE
  get "/delete_why/:id", :controller => "whies", :action => "destroy"
  #------------------------------

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
