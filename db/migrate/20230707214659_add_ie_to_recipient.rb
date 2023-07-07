class AddIeToRecipient < ActiveRecord::Migration[7.0]
  def up
    add_column :xmls, :recipient_ie, :string
  end

  def down
    remove_column :xmls, :recipient_ie
  end
end
