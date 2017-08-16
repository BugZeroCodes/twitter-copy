class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  serialize :following, Array
  has_many :tweets

  validates :username, presence: true, uniqueness: true

  validates :name, presence: true, uniqueness: true

  validates :color, format: { with: /\A#[0-9A-Fa-f]{6}\z/}

  mount_uploader :avatar, AvatarUploader
end
