class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text
    add_column :users, :city, :string
  end
end
