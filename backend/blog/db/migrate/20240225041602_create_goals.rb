class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.string :name
      t.string :description
      t.datetime :target_date
      t.integer :status
      t.integer :event_id

      t.timestamps
    end

    add_foreign_key :goals, :events
  end
end
