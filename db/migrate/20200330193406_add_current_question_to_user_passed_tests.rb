class AddCurrentQuestionToUserPassedTests < ActiveRecord::Migration[6.0]
  def change
    change_table :user_passed_tests do |t|
      t.references :current_question, foreign_key: { to_table: :questions  }
    end
  end
end
