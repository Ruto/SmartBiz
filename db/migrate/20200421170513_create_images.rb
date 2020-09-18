class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :name
      t.text :desc
      t.text :memo
      t.references :imageable, polymorphic: true, null: false
      t.boolean :checked, default: false
   #  t.string :workflow_state    

      t.timestamps
    end
  end
end
