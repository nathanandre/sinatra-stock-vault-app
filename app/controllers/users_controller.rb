class UsersController < ApplicationController
    get '/login' do # <- get login, is going to load my 'login' page. 
        erb :login  #<- render the login form view where credentials are submitted. 
    end 

    # This route receives login form then finds user and logs the user in (create a session). 
    post '/login' do 
        @user = User.find_by(email: params[:email]) # <- here we find the user using the login, i.e, email 
        if @user.authenticate(params[:password]) # <- here we authenticate that the email/password combination is correct. 
            session[:user_id] = @user.id # <- this actually logs in and assigns a key value pair to the session hash. 
            puts session 
            redirect "users/#{@user.id}" # <- show page (if we login we then redirect to the users show page.)
        else

        end 
    end 

    # this route renders the sign up form 
    get '/signup' do 
        erb :signup # <- when we signup we're gonna send a post request, 'post users'. params has all the information to create a new user as long as the hashes aren't empty. 
    end 

    # here is where we will create a new user and persist them to the Database. 
    post '/users' do 
        if params[:name] != "" && params[:email] != "" && params[:password] != "" # <- if these three hashes are not empty, we can then create the user. 
            @user = User.create(params) # <- create new user and assign it to an instance variable. 
            redirect "/users/#{@user.id}" # redirect to the new users how page. <- this becomes a new http request. Post is where you create new users after it redirects to the route who shows you the new user. 
        else 
        end 
    end 

    get '/users/:id' do 
        @user = User.find_by(id: params[:id]) 
        
         erb :'/users/show'
    end 
     
end 