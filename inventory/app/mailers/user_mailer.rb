class UserMailer < ApplicationMailer
  default from: 'nokutu@openmailbox.com'
  def notification(user, petition)
    @user = user
    @petition = petition
    mail(to: @user.email, subject: 'Peticion contestada')
  end
end
