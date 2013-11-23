# Clean up databases
User.destroy_all
Lesson.destroy_all
Question.destroy_all
Response.destroy_all
@user_id=[]

5.times do 
  u=User.create ({first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, role: "student" })
    @user_id<<u.id
end

User.create ({first_name: "Ben", last_name: "Sanoff", email: "ben_sanoff@gmail.com", role: "teacher" })

10.times do |x|
  l=Lesson.create({title: Faker::Lorem.sentence, sequence: x
    })

  3.times do |y|
    q=l.questions.create(text: "#{Faker::Lorem.sentence} Choose a, b, c, d", type: "mc")
    5.times do 
      r= q.responses.create(value: "a")
      User.find(@user_id.sample).responses<<r
    end
  end
end
