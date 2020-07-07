class UpdateForeignKeyUserPassedTests < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :user_passed_tests, :tests
    add_foreign_key :user_passed_tests, :tests
  end
end
