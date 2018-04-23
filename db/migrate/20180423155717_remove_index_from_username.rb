class RemoveIndexFromUsername < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :username
    add_index :users, :uid, unique: true
  end
end
