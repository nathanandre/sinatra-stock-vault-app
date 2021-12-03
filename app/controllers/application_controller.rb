require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "stock_vault_app"
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    def looged_in? #this will be true if user is logged in, if not false
      !!current_user 
    end 

    def current_user
      # @current_user ||=, will limit calls to the data base, after the first call a subsequent call to current_user won't hit the database again. 
      @current_user ||= User.find_by(id: session[:user_id]) 
    end 
  end 

end
