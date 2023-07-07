class ChangeColumnsNameInXmlTable < ActiveRecord::Migration[7.0]
  def up
    rename_column :xmls, :company_name, :recipient_name
    rename_column :xmls, :cnpj, :recipient_cnpj
  end

  def down
    rename_column :xmls, :recipient_name, :company_name
    rename_column :xmls, :recipient_cnpj, :cnpj
  end
end
