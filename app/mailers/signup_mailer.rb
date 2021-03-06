class SignupMailer < ActionMailer::Base
  default from: "donotreply@gametheoryacademy.org"

  def invite(user, password)
    @user = user
    @password = password
    mail(to: user.email, cc: 'trish@gametheoryacademy.org', subject: "Welcome to the Oakland Youth-Friendly Business Directory!")
  end
end
