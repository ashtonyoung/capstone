class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.date :start_date
      t.date :end_date
      t.string :name
      t.string :description
      t.integer :goal
      t.references :chapter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
