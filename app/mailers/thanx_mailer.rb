class ThanxMailer < ApplicationMailer
   def complete_registration(email,name)
     @username = name
     mail from: '口コミ複業パラキャリ <tanachu_78@yahoo.co.jp>', to: email, bcc: "ytk0202@outlook.jp", subject: '【パラキャリ】会員登録完了のお知らせ'
    end
end
