Rails.application.routes.draw do



  # Routes for the Podcast resource:

  # CREATE
  match("/insert_podcast", { :controller => "podcasts", :action => "create", :via => "post"})
          
  # READ
  match("/podcasts", { :controller => "podcasts", :action => "index", :via => "get"})
  
  match("/podcasts/:id_from_path", { :controller => "podcasts", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_podcast/:id_from_path", { :controller => "podcasts", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_podcast/:id_from_path", { :controller => "podcasts", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Article resource:

  # CREATE
  match("/insert_article", { :controller => "articles", :action => "create", :via => "post"})
          
  # READ
  match("/articles", { :controller => "articles", :action => "index", :via => "get"})
  
  match("/articles/:id_from_path", { :controller => "articles", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_article/:id_from_path", { :controller => "articles", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_article/:id_from_path", { :controller => "articles", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Show resource:

  # CREATE
  match("/insert_show", { :controller => "shows", :action => "create", :via => "post"})
          
  # READ
  match("/shows", { :controller => "shows", :action => "index", :via => "get"})
  
  match("/shows/:id_from_path", { :controller => "shows", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_show/:id_from_path", { :controller => "shows", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_show/:id_from_path", { :controller => "shows", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Book resource:

  # CREATE
  match("/insert_book", { :controller => "books", :action => "create", :via => "post"})
          
  # READ
  match("/books", { :controller => "books", :action => "index", :via => "get"})
  
  match("/books/:id_from_path", { :controller => "books", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_book/:id_from_path", { :controller => "books", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_book/:id_from_path", { :controller => "books", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for signing up

  match("/user_sign_up", { :controller => "users", :action => "new_registration_form", :via => "get"})
  
  # Routes for signing in
  match("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form", :via => "get"})
  
  match("/user_verify_credentials", { :controller => "user_sessions", :action => "add_cookie", :via => "post"})
  
  # Route for signing out
  
  match("/user_sign_out", { :controller => "user_sessions", :action => "remove_cookies", :via => "get"})
  
  # Route for creating account into database 

  match("/post_user", { :controller => "users", :action => "create", :via => "post" })
  
  # Route for editing account
  
  match("/edit_user", { :controller => "users", :action => "edit_registration_form", :via => "get"})
  
  match("/patch_user", { :controller => "users", :action => "update", :via => "post"})
  
  # Route for removing an account
  
  match("/cancel_user_account", { :controller => "users", :action => "destroy", :via => "get"})


  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
