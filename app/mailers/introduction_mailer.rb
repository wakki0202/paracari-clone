class IntroductionMailer < ApplicationMailer
  def complete_introduction(introduction, work, current_user)
    @introduction = introduction
    @work = work
    @current_user = current_user
    mail(
      to: @work.provider.email,
      subject: '口コミのお知らせ'
    )
  end
end
