class Question < ActiveRecord::Base
  validates_inclusion_of :question_type, :in => ["SA", "MC"]
  belongs_to :lesson
  has_many :responses
end
