class AddUserattributetwoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :career, :integer
    add_column :users, :certification, :string
  end
end
