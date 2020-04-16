class User < ApplicationRecord
  include Auth

  has_many :user_passed_tests
  has_many :tests, through: :user_passed_tests
  has_many :author_tests, class_name: "Test"

  has_secure_password

  def test_passage(level)
    tests.where(level: level)
  end

  def user_passed_test(test)
    user_passed_tests.order(id: :desc).find_by(test_id: test.id)
  end

 end
