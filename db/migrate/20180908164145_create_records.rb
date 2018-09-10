class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.date :recordDate
      t.integer :participation
      t.integer :meal
      t.integer :activity
      t.string :comment
      t.integer :user_id
      t.integer :child_id

      t.timestamps
    end
  end
end
