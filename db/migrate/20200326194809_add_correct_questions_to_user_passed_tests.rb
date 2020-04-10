class AddCorrectQuestionsToUserPassedTests < ActiveRecord::Migration[6.0]
  def change
    add_column :user_passed_tests, :correct_questions, :integer, default: 0
  end
end
