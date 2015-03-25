class CreateAnswerTable < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id, null: false
      t.integer :user_id, null: false
      t.string :body, null: false
    end
  end
end
