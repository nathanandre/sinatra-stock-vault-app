class AddUserIdToPortfoiio < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :user_id, :integer 
  end
end
