class CreateUserPermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_permissions do |t|

      t.belongs_to :user, foreign_key: { on_delete: :cascade }, index: true
      t.belongs_to :permission, foreign_key: { on_delete: :cascade }, index: true

      t.timestamps
    end
  end
end
