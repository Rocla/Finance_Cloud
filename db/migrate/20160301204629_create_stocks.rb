class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :ticker
      t.decimal :last_closing

      t.timestamps null: false
    end
  end
end
