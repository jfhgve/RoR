class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.string :friend_numb
      t.integer :quantity

      t.timestamps
    end
  end
end
