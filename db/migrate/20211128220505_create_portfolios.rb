class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t| 
      t.string :name 
      t.integer :number_of_stocks 
      t.float :total_value 

      t.timestamps null: false 
    end 
  end
end
