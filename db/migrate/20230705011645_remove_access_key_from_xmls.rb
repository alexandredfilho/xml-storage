class RemoveAccessKeyFromXmls < ActiveRecord::Migration[7.0]
  def up
    remove_column :xmls, :access_key
  end

  def down
    add_column :xmls, :access_key, :string
  end
end
