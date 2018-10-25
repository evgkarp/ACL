class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.string :action

      t.belongs_to :article, foreign_key: { on_delete: :cascade }, index: true

      t.timestamps
    end
  end
end
