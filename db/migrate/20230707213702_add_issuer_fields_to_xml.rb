class AddIssuerFieldsToXml < ActiveRecord::Migration[7.0]
  def up
    add_column :xmls, :issuer_name, :string
    add_column :xmls, :issuer_cnpj, :string
    add_column :xmls, :issuer_ie, :string
  end

  def down
    remove_column :xmls, :issuer_name
    remove_column :xmls, :issuer_cnpj
    remove_column :xmls, :issuer_ie
  end
end
