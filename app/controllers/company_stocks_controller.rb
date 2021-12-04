class CompanyStocksController < ApplicationController
    # here we will get company_stock to render a form for a new stock entry
    get '/company_stock/new' do
        
        erb :'/company_stocks/new' #<- render form to create a new stock. form nestled in 'new' under the company_stocks folder in views 
    end 

    post '/company_stocks' do 
        
    end 
end 