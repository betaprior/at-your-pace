class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :type
      t.text :text
      t.references :lesson
    end
  end
end
