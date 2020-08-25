class AddStructurableToStructure < ActiveRecord::Migration[6.0]
  def change
    add_reference :structures, :structurable, polymorphic: true, index: true # null: true,
  end
end
