class Note < ApplicationRecord
  has_many :note_and_tags
  has_many :tags, through: :note_and_tags
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  
  
end
