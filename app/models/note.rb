class Note < ApplicationRecord
  has_many :note_and_tags, dependent: :destroy
  has_many :tags, through: :note_and_tags
  has_many :note_images, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  
  
end
