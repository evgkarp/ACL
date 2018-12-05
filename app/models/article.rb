class Article < ApplicationRecord
  belongs_to :user
  has_many :permissions, as: :permissible, dependent: :destroy
  accepts_nested_attributes_for :permissions

  validates :title, :body, presence: true
end
