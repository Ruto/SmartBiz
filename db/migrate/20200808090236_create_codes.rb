class CreateCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :codes do |t|
      t.string :code
      t.string :system_code
      t.string :custom_code
      t.string :barcode
      t.references :codable, polymorphic: true, null: false
      t.boolean :active
      t.references :user, null: false, foreign_key: true
   #  t.string :workflow_state    

      t.timestamps
    end
  end
end
