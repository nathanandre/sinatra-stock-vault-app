# seed data 

#Users 
nathan = User.create(name: "Nathan", email: "nathan@email.com", password: "password")
john = User.create(name: "John", email: "john@email.com", password: "password")

#Company stocks 
CompanyStock.create(name: "Apple Inc.", ticker: "AAPL", description: "Technology Company", price: 166.50, user_id: nathan.id)
CompanyStock.create(name: "Johnson & Johnson", ticker: "JJ", description: "Pharma Company", price: 200.50, user_id: john.id)

