class Permission < ApplicationRecord
  ACTIONS = ['show', 'update'].freeze

  belongs_to :article
  has_many :user_permissions
  has_many :users, through: :user_permissions
end
