class CreateStructures < ActiveRecord::Migration[6.0]
  def change
    create_table :structures do |t|
      t.string :name
      t.string :alias
      t.string :type
      t.string :ancestry
      t.string :category
      t.boolean :active, default: true
      t.integer :structure_id
      t.references :structurable, polymorphic: true, null: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :structures, [:ancestry, :structure_id]
  end
end
