class UserMailer < ApplicationMailer

  def send_newsletter(user)
    @newsletter = user.serve
    @user = user
    mail to: user.email
      subject: "Your Newsfeed For #{Date.today.to_s}"
  end

  def daily_mailer
    User.all.each do |user|
      send_newsletter(user).deliver_now
    end
  end
end
