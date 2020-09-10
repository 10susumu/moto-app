class Comment < ApplicationRecord
  with_options presence: true do
    validates :user_id
    validates :content_id
    validates :text
  end

  belongs_to :user
  belongs_to :content
end
