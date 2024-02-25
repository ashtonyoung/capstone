class AddIndexes < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :email
    add_index :users, :handle
    add_index :events, :user_id
    add_index :chapters, :event_id
    add_index :goals, :event_id
  end
end
