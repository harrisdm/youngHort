# == Route Map
#
#                   Prefix Verb   URI Pattern                    Controller#Action
#              posts_index GET    /posts/index(.:format)         posts#index
#                posts_new GET    /posts/new(.:format)           posts#new
#             posts_create GET    /posts/create(.:format)        posts#create
#               posts_edit GET    /posts/edit(.:format)          posts#edit
#             posts_update GET    /posts/update(.:format)        posts#update
#            posts_destroy GET    /posts/destroy(.:format)       posts#destroy
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        registrations#cancel
#        user_registration POST   /users(.:format)               registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       registrations#new
#   edit_user_registration GET    /users/edit(.:format)          registrations#edit
#                          PATCH  /users(.:format)               registrations#update
#                          PUT    /users(.:format)               registrations#update
#                          DELETE /users(.:format)               registrations#destroy
#                     root GET    /                              pages#home
#               pages_home GET    /pages/home(.:format)          pages#home
#             pages_secure GET    /pages/secure(.:format)        pages#secure
#

Rails.application.routes.draw do
  
resources :posts
resources :mentors

  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'

  get 'pages/home'

  get 'pages/secure'

  
end
