class Chat < ApplicationRecord
  with_options presence: true do
    validates :text
    validates :master_user_id
  end

  belongs_to :user
end
