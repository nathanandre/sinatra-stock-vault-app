class UsersController < ApplicationController
    get '/login' do 
        erb :login 
    end 

    # This route receives login form ten finds user and logs the user in (create a session). 
    post '/login' do 

    end 

    get '/signup' do 
    end 
     
end 