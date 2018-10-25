class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_many :user_permissions
  has_many :permissions, through: :user_permissions

  def author_of?(resource)
    id == resource.user_id
  end
end
