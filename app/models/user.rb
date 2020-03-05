class User < ApplicationRecord
  has_many :user_passed_tests
  has_many :tests, through: :user_passed_tests
  has_many :author_tests, class_name: "Test"
  def test_passage(level)
    tests.where(level: level)
  end
end