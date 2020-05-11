class TestsMailer < ApplicationMailer

  def completed_test(user_passed_test)
    @user = user_passed_test.user
    @test = user_passed_test.test

    mail to: @user.email
  end

end
