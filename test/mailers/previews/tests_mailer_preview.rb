# Preview all emails at http://localhost:3000/rails/mailers/tests_mailer
class TestsMailerPreview < ActionMailer::Preview

  def completed_test
    user_passed_test = UserPassedTest.new(user: User.first, test: Test.first)

    TestsMailer.completed_test(user_passed_test)
  end
end
