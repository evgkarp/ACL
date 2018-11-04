class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_many :user_permissions, dependent: :destroy
  has_many :permissions, through: :user_permissions

  validates :name, presence: true, uniqueness: true

  def can_read?(permissible)
    has_permission?(permissible, :read)
  end

  def can_write?(permissible)
    has_permission?(permissible, :write)
  end

  def author_of?(resource)
    id == resource.user_id
  end

  private

  def has_permission?(permissible, action)
    permissions.includes(:user_permissions)
      .where(action: action, permissible: permissible).exists? || author_of?(permissible)
  end
end
