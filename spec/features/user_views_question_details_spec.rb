require 'rails_helper'

feature 'user views question details', %Q{
  As a user
  I want to view a question's details
  So that I can effectively understand the question
} do

  scenario 'user views a questions details' do
    user = User.create(username: 'paulthiebauth', email: 'paul@launch.com', password: 'password')
    question = Question.create(user_id: user.id, title: "Tightttttttttttttttt", body: "Greattttttttttttttt")
    visit question_path(question)
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.body)
  end

end
