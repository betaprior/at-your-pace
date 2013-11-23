class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :type
      t.string :text
      t.references :lesson
    end
  end
end
