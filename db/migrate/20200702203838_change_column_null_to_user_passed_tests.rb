class ChangeColumnNullToUserPassedTests < ActiveRecord::Migration[6.0]
  def change
    change_column_null :user_passed_tests, :test_id, true
    change_column_null :user_passed_tests, :user_id, true
  end
end
