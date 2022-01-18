class AddNameToKits < ActiveRecord::Migration[7.0]
  def change
    add_column :kits, :name, :string
  end
end
