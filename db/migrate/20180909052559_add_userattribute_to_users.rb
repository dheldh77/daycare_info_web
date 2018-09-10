class AddUserattributeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :userage, :integer
    add_column :users, :usersex, :string
    add_column :users, :usertype, :string
    add_column :users, :telephone, :string
  end
end
