class CompanyStocksController < ApplicationController
    # here we will get company_stock to render a form for a new stock entry
    get '/company_stock/new' do
        
        erb :'/company_stocks/new' #<- render form to create a new stock. form nestled in 'new' under the company_stocks folder in views 
    end 

    post '/company_stock' do #<- create new stock. saves it to the data base. 
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

    get '/company_stock/:id' do #<- show route. 
        @company_stock = CompanyStock.find(params[:id])
        erb :'/company_stocks/show'
    end 

    get '/company_stock/:id/edit' do #<- This route is going to send us to company_stock/edit.erb, which will render an edit form 
        @company_stock = CompanyStock.find(params[:id]) 
        if logged_in? 
            if @company_stock.user == current_user #<- if the user is equal to the current user that is logged in they will be able to edit the stock. 
                erb :'company_stocks/edit'
            else 
                redirect "users/#{current_user.id}"
            end
        else 
            redirect '/'
        end  
    end 

    post '/company_stock/:id' do #<- this will find then modify/update the stock. Then redirect to show page. 
        set_company_stock 
        @company_stock.update(name: params[:name], ticker: params[:ticker], description: params[:description], price: params[:price]) # <- active record method to update 
        redirect "/company_stock/#{@company_stock.id}" 
    end 

    private 

    def set_company_stock #< - created a helper method 
        @company_stock = CompanyStock.find(params[:id])
    end 

end 