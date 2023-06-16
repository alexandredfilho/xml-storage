class CreateXmls < ActiveRecord::Migration[7.0]
  def change
    create_table :xmls do |t|

      t.timestamps
    end
  end
end
