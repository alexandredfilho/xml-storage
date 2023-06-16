class CreateImportedDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :imported_documents do |t|
      t.string :access_key

      t.timestamps
    end
  end
end
