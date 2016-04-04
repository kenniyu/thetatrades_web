class CreateTickers < ActiveRecord::Migration
  def change
    create_table :tickers do |t|
      t.string :title
      t.string :name

      t.timestamps null: false
    end
  end
end
