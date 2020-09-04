class Content < ApplicationRecord

  with_options presence: true do
    validates :user_id
    validates :text
  end

  has_one_attached :image
  has_many :comments
end
