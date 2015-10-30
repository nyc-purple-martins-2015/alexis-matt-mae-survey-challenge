class Choice < ActiveRecord::Base
  has_many :choices
  belongs_to :survey

  validates :prompt, presence: true
end
