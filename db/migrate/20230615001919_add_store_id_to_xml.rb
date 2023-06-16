class AddStoreIdToXml < ActiveRecord::Migration[7.0]
  def change
    add_reference :xmls, :store, null: false, foreign_key: true
  end
end
