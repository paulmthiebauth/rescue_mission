class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  validates :user, presence: true
  validates :title, presence: true, length: { minimum: 10 }
  validates :body, presence: true, length: { minimum: 10 }
end
