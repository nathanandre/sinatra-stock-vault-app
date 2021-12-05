class CompanyStocksController < ApplicationController
    # here we will get company_stock to render a form for a new stock entry
    get '/company_stock/new' do
        
        erb :'/company_stocks/new' #<- render form to create a new stock. form nestled in 'new' under the company_stocks folder in views 
    end 

    post '/company_stocks' do #<- create new journal entry. saves it to the data base. 
        if !logged_in?
            redirect '/'
        end 
        if params[:name] && params[:ticker] && params[:description] != "" #<- if these fields in the new stock form are not empty then we will create a new company stocks using the params
            @company_stock = CompanyStock.create(name: params[:name], ticker: params[:ticker], description: params[:description], user_id: current_user.id) #<- creating a new instance of a stock and saving it under the instance variable @company_stock 
            redirect "/company_stock/#{@company_stock.id}"
        else 
            redirect '/company_stock/new'
        end 

    end 
end 