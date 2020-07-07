class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <alexrailsruby@gmail.com>}
  layout 'mailer'
end
