Rails.application.routes.draw do
  # Routes for the Inquiry resource:
  # CREATE
  get "/inquiries/new", :controller => "inquiries", :action => "new"
  post "/create_inquiry", :controller => "inquiries", :action => "create"

  # READ
  get "/inquiries", :controller => "inquiries", :action => "index"
  get "/inquiries/:id", :controller => "inquiries", :action => "show"

  # UPDATE
  get "/inquiries/:id/edit", :controller => "inquiries", :action => "edit"
  post "/update_inquiry/:id", :controller => "inquiries", :action => "update"

  # DELETE
  get "/delete_inquiry/:id", :controller => "inquiries", :action => "destroy"
  #------------------------------

  # Routes for the Vost resource:
  # CREATE
  get "/vosts/new", :controller => "vosts", :action => "new"
  post "/create_vost", :controller => "vosts", :action => "create"

  # READ
  get "/vosts", :controller => "vosts", :action => "index"
  get "/vosts/:id", :controller => "vosts", :action => "show"

  # UPDATE
  get "/vosts/:id/edit", :controller => "vosts", :action => "edit"
  post "/update_vost/:id", :controller => "vosts", :action => "update"

  # DELETE
  get "/delete_vost/:id", :controller => "vosts", :action => "destroy"
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
