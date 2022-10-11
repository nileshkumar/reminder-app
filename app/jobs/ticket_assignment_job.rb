class TicketAssignmentJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Ticket.find_each do |ticket|
      if ticket.user.send_due_date_reminder
        Time.use_zone(ticket.user.time-zone) do #user's time zone
          if due_date_reminder_time == 0 #will send email on same due date
            NotificationMailer.with(ticket: @ticket).notify_user.deliver_now if Time.now.in_time_zone == ticket.due_date
          else 
            NotificationMailer.with(ticket: @ticket).notify_user.deliver_now if Time.now.in_time_zone.to_date == ticket.due_date - due_date_reminder_time
          end
        end
      end
    end
  end
end
