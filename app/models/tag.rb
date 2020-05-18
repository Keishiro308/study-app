class Tag < ApplicationRecord
  has_many :question_and_tags
  has_many :questions, through: :question_and_tags
end
