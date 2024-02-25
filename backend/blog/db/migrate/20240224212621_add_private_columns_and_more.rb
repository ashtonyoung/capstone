class AddPrivateColumnsAndMore < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :chapters, :users
    remove_foreign_key :events, :chapters

    change_table :users do |t|
      t.boolean :private, default: true
    end

    change_table :events do |t|
      t.boolean :private, default: true
      t.remove :chapter_id, type: :integer
      t.integer :user_id
      t.remove :goal, type: :integer
    end

    change_table :chapters do |t|
      t.boolean :private, default: true
      t.rename :expiration_date, :expires_at
      t.remove :user_id, type: :integer
      t.integer :event_id
    end

    change_table :posts do |t|
      t.boolean :private, default: true
      t.boolean :published, default: true
      t.datetime :written_at
      t.integer :emotion, default: 1  # Defaults to 'neutral' enum
    end

    add_foreign_key :chapters, :events
    add_foreign_key :events, :users
  end
end
