class AddUserToTrade < ActiveRecord::Migration
  def change
    change_table :trades do |t|
      t.references :user, index: true, foreign_key: true
    end
  end
end
