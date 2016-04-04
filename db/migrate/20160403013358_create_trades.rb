class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.string :title
      t.text :description
      t.references :ticker, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
