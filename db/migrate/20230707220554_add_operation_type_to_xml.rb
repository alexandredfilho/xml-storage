class AddOperationTypeToXml < ActiveRecord::Migration[7.0]
  def up
    add_column :xmls, :operation_type, :string
  end

  def down
    remove_column :xmls, :operation_type
  end
end
