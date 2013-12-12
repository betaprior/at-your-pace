class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  attr_accessible :epoch_time, :user_name, :lesson_name, :lesson_id, :value, :correct
  def epoch_time
    created_at.strftime('%s')
  end
  def user_name
    user.first_name + " " + user.last_name
  end
  def lesson_name
    question.lesson.title
  end
  def lesson_id
    question.lesson.id
  end
end
