class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :chats
  has_one_attached :avatar
  has_one_attached :image

  validates :nickname, presence: true
  # validates :password, length: { minimum: 6 }
  # PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  # validates :password, format: { with: PASSWORD_REGEX }

end
