class Article < ApplicationRecord
  belongs_to :user
  has_many :permissions
  accepts_nested_attributes_for :permissions
end
