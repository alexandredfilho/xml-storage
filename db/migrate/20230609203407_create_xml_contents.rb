class CreateXmlContents < ActiveRecord::Migration[7.0]
  def change
    create_table :xml_contents do |t|
      t.string :company_name
      t.string :cnpj

      t.timestamps
    end
  end
end
