class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true

  has_many :surveys
  has_many :user_responses


  def list_surveys_created
    @array_of_survey_objects = self.surveys
  end

end
