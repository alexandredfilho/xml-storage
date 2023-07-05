class AddFieldsToXml < ActiveRecord::Migration[7.0]
  def up
    add_column :xmls, :company_name, :string
    add_column :xmls, :invoice, :string
    add_column :xmls, :cnpj, :string
    add_column :xmls, :icms, :float
    add_column :xmls, :ipi, :float
  end

  def down
    remove_column :xmls, :company_name
    remove_column :xmls, :invoice
    remove_column :xmls, :cnpj
    remove_column :xmls, :icms
    remove_column :xmls, :ipi
  end
end
