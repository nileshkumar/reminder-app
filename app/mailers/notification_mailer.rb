class NotificationMailer < ApplicationMailer
  def notify_user
    @ticket = params[:ticket]

    mail(
      to: email_address_with_name(@ticket.project_member_mail, @ticket.project_member_name), 
      subject: "A new Ticket assigned!"
    ) 
  end
end
