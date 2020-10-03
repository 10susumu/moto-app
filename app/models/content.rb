class Content < ApplicationRecord

  with_options presence: true do
    validates :user_id
    validates :text
    validates :image
  end

  belongs_to :user, optional: true
  has_one_attached :image
  has_many :comments
end
