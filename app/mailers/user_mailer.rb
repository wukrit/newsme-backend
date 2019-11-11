class UserMailer < ApplicationMailer
  default from: 'newsmedaily@yahoo.com'

  def newsletter
    @user = params[:user]
    @newsletter = @user.serve
    mail (to: user.email, subject: "Your Newsfeed For #{Date.today.to_s}")
  end

end
