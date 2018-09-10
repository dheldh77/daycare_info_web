class CreateChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :children do |t|
      t.string :name
      t.integer :age
      t.integer :gender
      t.integer :kindergarden_id
      t.string :className
      t.integer :classNumber
      t.boolean :allday
      t.string :thumbnail
      t.integer :user_id

      t.timestamps
    end
  end
end
