class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.integer :stock_id
      t.integer :portfolio_id
      t.timestamps
    end
  end
end
