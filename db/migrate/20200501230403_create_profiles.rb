class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :phone
      t.string :email
      t.string :phone_token
      t.string :email_token
      t.references :user, null: false, foreign_key: true
      t.references :structure, null: false, foreign_key: true
      t.references :images, null: true, foreign_key: true
      t.text :desc
      t.integer :inviter
      t.boolean :confirmed_profile, default: false
      t.boolean :revoke_profile, default: false
      t.integer :confirmed_by
      t.integer :revoked_by
   #  t.string :workflow_state    

      t.timestamps
    end
    add_index :profiles, :phone_token, unique: true
    add_index :profiles, :email_token, unique: true
    add_index :profiles, :inviter
    add_index :profiles, :confirmed_by
    add_index :profiles, :revoked_by
  end
end
