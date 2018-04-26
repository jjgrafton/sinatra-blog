require 'sinatra'
require 'sinatra/activerecord' 
require 'rake'
require 'pg'

set :database, {adapter: 'postgresql', database: 'crime_blog'}

enable :sessions

get '/signup' do
    erb :'/users/signup'
end

get '/login' do
    erb :'users/login'
end

get '/profile' do
    @user = User.find(session[:id])
    erb :'/users/show'

get '/logout' do
    session.clear
    redirect 'users/login'
end
    
post '/user/login' do 
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user != nil
        session[:id] = @user.id
        erb :profile
    else   
        redirect 'users/signup'
    end 
end
    
post '/user/new' do 
    # @newuser = User.create(first_name: params[:first_name], last_name: params[:last_name] email: params[:email], password: params[:password], birthday: params[:birthday])
    #Setting the session with key of ID to be equal to the users id
    #Essentialy this "Logs them in"
    session[:id] = @newuser.id
    redirect 'users/show'
end

delete '/user/:id' do 
    User.destroy(params[:id])
    redirect 'users/signup'
end
end
    