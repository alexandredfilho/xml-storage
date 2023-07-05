class AddKeyToXmls < ActiveRecord::Migration[7.0]
  def up
    add_column :xmls, :key, :string
  end

  def down
    remove_column :xmls, :key
  end
end
