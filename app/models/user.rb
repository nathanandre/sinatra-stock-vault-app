class User < ActiveRecord::Base 
    has_secure_password 

    has_many :company_stocks, through: :portfolios 
end 