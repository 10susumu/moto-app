class Comment < ApplicationRecord
  with_options presence: true do
    validates :text
  end

  belongs_to :user
  belongs_to :content
end
