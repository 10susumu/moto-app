class Chat < ApplicationRecord
  with_options presence: true do
    validates :master_user_id
    validates :user_id
    validates :text
  end

  belongs_to :user
end
