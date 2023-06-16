class AddStoreIdToXml < ActiveRecord::Migration[7.0]
  def change
    add_reference :xmls, :imported_document, null: false, foreign_key: true
  end
end
