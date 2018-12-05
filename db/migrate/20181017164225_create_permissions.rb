class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.string :action

      t.string :permissible_type
      t.bigint :permissible_id

      t.belongs_to :permissible, polymorphic: true, index: true

      t.timestamps
    end
  end
end
