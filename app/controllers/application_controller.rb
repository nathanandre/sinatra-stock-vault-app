require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "stock_vault_app"
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else 
      erb :welcome
    end  
  end

  helpers do 
    def logged_in? #this will be true if user is logged in, if not false
      !!current_user 
    end 

    def current_user
      # @current_user ||=, will limit calls to the data base, after the first call a subsequent call to current_user won't hit the database again. 
      @current_user ||= User.find_by(id: session[:user_id]) 
    end 
  end 

end
