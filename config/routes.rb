# == Route Map
#
#                   Prefix Verb   URI Pattern                             Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)               devise/sessions#destroy
#            user_password POST   /users/password(.:format)               devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)           devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)          devise/passwords#edit
#                          PATCH  /users/password(.:format)               devise/passwords#update
#                          PUT    /users/password(.:format)               devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                 registrations#cancel
#        user_registration POST   /users(.:format)                        registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                registrations#new
#   edit_user_registration GET    /users/edit(.:format)                   registrations#edit
#                          PATCH  /users(.:format)                        registrations#update
#                          PUT    /users(.:format)                        registrations#update
#                          DELETE /users(.:format)                        registrations#destroy
#                     root GET    /                                       pages#home
#             profile_edit GET    /profile/edit(.:format)                 profiles#edit
#                  profile PATCH  /profile(.:format)                      profiles#update
#                 profiles GET    /profiles/:id(.:format)                 profiles#show
#       profile_delete_img DELETE /profile/delete_img(.:format)           profiles#delete_img
#               pages_home GET    /pages/home(.:format)                   pages#home
#         slideshow_images GET    /slideshow_images(.:format)             slideshow_images#index
#                          POST   /slideshow_images(.:format)             slideshow_images#create
#      new_slideshow_image GET    /slideshow_images/new(.:format)         slideshow_images#new
#          slideshow_image DELETE /slideshow_images/:id(.:format)         slideshow_images#destroy
#  disable_slideshow_image PATCH  /slideshow_images/disable/:id(.:format) slideshow_images#disable
#   enable_slideshow_image PATCH  /slideshow_images/enable/:id(.:format)  slideshow_images#enable
#                    posts GET    /posts(.:format)                        posts#index
#                          POST   /posts(.:format)                        posts#create
#                 new_post GET    /posts/new(.:format)                    posts#new
#                edit_post GET    /posts/:id/edit(.:format)               posts#edit
#                     post GET    /posts/:id(.:format)                    posts#show
#                          PATCH  /posts/:id(.:format)                    posts#update
#                          PUT    /posts/:id(.:format)                    posts#update
#                          DELETE /posts/:id(.:format)                    posts#destroy
#                  mentors GET    /mentors(.:format)                      mentors#index
#                          POST   /mentors(.:format)                      mentors#create
#               new_mentor GET    /mentors/new(.:format)                  mentors#new
#              edit_mentor GET    /mentors/:id/edit(.:format)             mentors#edit
#                   mentor GET    /mentors/:id(.:format)                  mentors#show
#                          PATCH  /mentors/:id(.:format)                  mentors#update
#                          PUT    /mentors/:id(.:format)                  mentors#update
#                          DELETE /mentors/:id(.:format)                  mentors#destroy
#        delete_img_mentor DELETE /mentor/:id/delete_img(.:format)        mentors#delete_img
#              ambassadors GET    /ambassadors(.:format)                  ambassadors#index
#                          POST   /ambassadors(.:format)                  ambassadors#create
#           new_ambassador GET    /ambassadors/new(.:format)              ambassadors#new
#          edit_ambassador GET    /ambassadors/:id/edit(.:format)         ambassadors#edit
#               ambassador PATCH  /ambassadors/:id(.:format)              ambassadors#update
#                          PUT    /ambassadors/:id(.:format)              ambassadors#update
#                          DELETE /ambassadors/:id(.:format)              ambassadors#destroy
#    delete_img_ambassador DELETE /ambassador/:id/delete_img(.:format)    ambassadors#delete_img
#                          GET    /*path(.:format)                        redirect(301, /)
#

Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }
  root to:  'pages#home'

  get       '/profile/edit'         =>  'profiles#edit'
  patch     '/profile/'             =>  'profiles#update'
  get       '/profiles/:id'         =>  'profiles#show',     as: 'profiles'
  delete    '/profile/delete_img'   =>  'profiles#delete_img'

  get       'pages/home'

  resources :slideshow_images, only: [:index, :new, :create, :destroy]
  patch     '/slideshow_images/disable/:id'  =>   'slideshow_images#disable',   as: 'disable_slideshow_image'
  patch     '/slideshow_images/enable/:id'   =>   'slideshow_images#enable',    as: 'enable_slideshow_image'

  resources :posts
  
  resources :mentors
  delete    '/mentor/:id/delete_img'  =>  'mentors#delete_img', as: 'delete_img_mentor'

  resources :ambassadors
  delete    '/ambassador/:id/delete_img'  =>  'ambassadors#delete_img', as: 'delete_img_ambassador'

  # get       "*path"           =>  redirect("/")

end
