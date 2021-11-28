class CreateCompanyStocks < ActiveRecord::Migration
  def change
    create_table :company_stocks do |t|
      t.string :name 
      t.string :ticker 
      t.string :description 
      t.float :price 
      t.integer :user_id 

      t.timestamps null: false
    end
  end
end
