require 'sinatra'
require 'sinatra/activerecord' 
require 'rake'
require 'pg'
require 'faker'

require_relative './models/user'
require_relative './models/post'
require_relative './models/tag'


set :database, {adapter: 'postgresql', database: 'crime_blog'}

enable :sessions

#welcome page
get '/' do 
    # if logged_in?
    #     redirect to '/users/show'
    # else
        erb :index
end
# end

#homepage
get '/home' do 
    @posts = Post.all
    erb :home
end

#signup page to create new user
get '/signup' do
    erb :'/users/signup'
end

#create new user
post '/user/new' do 
    @newuser = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], birthday: params[:birthday])
    session[:id] = @newuser.id
    redirect 'users/show'
end

#login page
get '/login' do
    erb :'users/login'
end

#process login request 
post '/user/login' do 
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user != nil
        session[:id] = @user.id
        erb :'users/show'
    else   
        redirect 'users/signup'
    end 
end

#logour process
get '/logout' do
    session.clear
    redirect 'users/login'
end

#show a user's profile and posts
get '/profile' do
    @user = User.find(session[:id])
    erb :'/users/show'

#user can delete their account
delete '/user/:id' do 
    User.destroy(params[:id])
    redirect 'users/signup'
end
end

#create new post
get '/posts/new' do
     erb :'posts/new'
end

#view all posts
get '/posts/all_posts' do 
    erb :'posts/all_posts'
end

#show a user's posts
get '/user/posts' do 
    erb :'/users/show'
end


   