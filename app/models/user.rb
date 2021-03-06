class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :questions, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :tags, through: :questions
  has_many :study_logs, through: :questions
  has_many :notes, dependent: :destroy
  
end
