class User < ActiveRecord::Base 
    has_secured_password 

    has_many :company_stocks, through: :portfolios 
end 