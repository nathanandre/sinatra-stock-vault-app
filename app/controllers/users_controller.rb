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
        erb :signup 
    end 

    # here is where we will create a new user and persist them to the Database. 
    post '/users' do 

    end 

    get '/users/:id' do 
        "this will be the user show route"
    end 
     
end 