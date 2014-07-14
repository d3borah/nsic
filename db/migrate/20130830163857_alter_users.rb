class AlterUsers < ActiveRecord::Migration
  def up
       add_column("users", "username", :string, :limit => 25)
       change_column("users", "email", :string, :limit => 100)
       rename_column("users", "password", "hashed_password")
       add_column("users", "salt", :string, :limit => 40)
       puts "***about to add an index ***"
       add_index("users", "username")
  end

  def down
       remove_index("users", "username")
       remove_column("users", "salt")
       rename_column("users", "password", "hashed_password")
       change_column("users", "email", :default => "", :null => false)
       remove_column("users", "username")
  end
end
