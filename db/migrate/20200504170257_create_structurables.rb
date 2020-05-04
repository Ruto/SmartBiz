class CreateStructurables < ActiveRecord::Migration[6.0]
  def change
    create_table :structurables, id: false  do |t|
      t.integer :structure_id
      t.integer :structured_id
      t.string :cost_code
      t.boolean :active, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :structurables, :structure_id
    add_index :structurables, :structured_id
  end
end
