class User < ActiveRecord::Base 
    has_secure_password #<- allows us to user the active record method 'authenticate'


    has_many :portfolios   
    has_many :company_stocks, through: :portfolios 
end 