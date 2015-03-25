class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates :user, presence: true
  validates :question, presence: true
  validates :body, presence: true, length: { minimum: 50 }
end
