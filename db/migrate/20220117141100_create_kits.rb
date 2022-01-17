class CreateKits < ActiveRecord::Migration[7.0]
  def change
    create_table :kits do |t|
      t.references :button, null: false, foreign_key: true
      t.references :fabric, null: false, foreign_key: true
      t.references :lining, null: false, foreign_key: true

      t.timestamps
    end
  end
end
