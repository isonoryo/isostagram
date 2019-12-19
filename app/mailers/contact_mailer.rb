class ContactMailer < ApplicationMailer
  def contact_mail(feed)
    @feed = feed
    mail to: @feed.user.email, subject: "投稿確認メール"
  end
end
