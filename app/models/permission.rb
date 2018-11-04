class Permission < ApplicationRecord
  ACTIONS = %i[read write].freeze

  belongs_to :permissible, polymorphic: true, optional: true
  has_many :user_permissions, dependent: :destroy
  has_many :users, through: :user_permissions
end
