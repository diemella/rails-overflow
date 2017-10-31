class Question < ApplicationRecord
  validates :question, :user_id, presence: true
end
