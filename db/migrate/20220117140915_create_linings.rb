class CreateLinings < ActiveRecord::Migration[7.0]
  def change
    create_table :linings do |t|
      t.string :name

      t.timestamps
    end
  end
end
