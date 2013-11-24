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

# 10.times do |x|
#   l=Lesson.create({title: "Lesson #{x+1} : #{Faker::Lorem.sentence}", sequence: x+1
#     })

#   # Multiple choice questions
#   3.times do |y|
#     q=l.questions.create(text: "#{Faker::Lorem.sentence} Choose A, B, C, D", type: "mc")
#     5.times do 
#       r= q.responses.create(value: ["A","B","C","D"].sample)
#       User.find(@user_id.sample).responses<<r
#     end
#   end

# end

# Actual Data
# Lesson
l=Lesson.create(title: "Fiscal Policy and Business Cycle", sequence: 11)
q=l.questions.create(text: "Explain the relationship between the business cycle and tax revenue / government spending. Why does this present a challenge to policy makers? ", type: "sa")
User.find(@user_id.sample).responses << q.responses.create(value: "The relationship is that during recessions, people have less money so the taxes that the government is able to impose are smaller, however, because people have less money they demand more cervices like health care and pensions from the government, which can make the government dive into depth since the fewer taxes that it collects cannot fulfill the increased welfare needs of the people. Policy makers have to devise solutions for balancing the smaller budget with the increased demand for free services, as well as plan for future shortcomings.
")

User.find(@user_id.sample).responses << q.responses.create(value: "As businesses make less money and are selling less of their goods and services the government begins to make less and less money as a result. If there is less to get taxes from the government has less time to spend. The issue that arises is that the best way to make the businesses begin to perform better is for the government to increase their spending.
Policy makers then have to decide where the best place is to put in the small amount of money that the government does have.")


User.find(@user_id.sample).responses << q.responses.create(value:"Tax revenue increases during economic expansion because of the general increase in household income, which translates into more income taxes being paid to the federal and state governments. Conversely, during a recession there is less tax revenue because households have less income. This is a problem because during expansions the government spends more money on government programs and military with their revenue, but during a recession when the government needs to spend more money to boost the economy, they have less revenue. This causes policy to consider saving more money during an economic expansion in order to prepare for a possible recession in the future.  
")
User.find(@user_id.sample).responses << q.responses.create(value:" During a recession, income decreases, and so income tax does so as well.  Government spending goes up during a recession, due to the Keynesian approach to the issue.  This is a challenge to policy makers, as taxes are needed for spending, and yet they run in reverse directions during recessions.  Policy makers must learn to balance this problem when creating laws.")
# massage the times 
