require 'rails_helper'

feature 'user views all questions', %Q{
  As a user
  I want to view recently posted questions
  So that I can help others
} do

  scenario 'user views all questions' do
    user = User.create(username: 'paulthiebauth', email: 'paul@launch.com', password: 'password')
    question = Question.create(user_id: user.id, title: "Tightttttttttttttttt", body: "Greattttttttttttttt")
    # visit '/questions'
    visit questions_path
    expect(page).to have_content(question.title)
  end

end
