class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true



  has_many :surveys
  has_many :user_responses
end
