class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true

  has_many :surveys
  has_many :user_responses


  def list_surveys_created
    @surveys = self.surveys
  end

  def list_surveys_taken
    @surveys_taken = self.user_responses
    @surveys = @surveys_taken.flat_map {|survey| Survey.where(id: survey.survey_id) }.uniq
  end

end

# surveys.map do |surve

# surveys.map {|survey| Survey.where(id: survey.survey_id)}.flatten.map{|survey| survey.title}.uniq.join("")
