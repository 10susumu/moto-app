class Content < ApplicationRecord

  with_options presence: true do
    validates :user_id
    # validates :image
    validates :text
  end

  has_one_attached :image
end
