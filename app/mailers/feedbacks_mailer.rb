class FeedbacksMailer < ApplicationMailer
  before_action :find_admin

  def feedback(feedback)
    @feedback = feedback
    mail to: @admin.email, from: @feedback.user.email, subject: @feedback.title
  end

  private

  def find_admin
    @admin = Admin.first
  end
end
