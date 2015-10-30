class Survey < ActiveRecord::Base
  has_many :questions
  has_many :user_responses
  belongs_to :user

  validates :title, presence: true, uniqueness: true
end
