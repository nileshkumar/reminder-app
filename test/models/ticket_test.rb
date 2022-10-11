require "test_helper"

class TicketTest < ActiveSupport::TestCase
  setup do
    @user = User.create(name: 'test', mail: 'test@gmail.com', time_zone: "Alaska", due_date_reminder_interval: 0)
  end

  test "should save a ticket" do
    user = User.create(name: 'test', mail: 'test@gmail.com', time_zone: "Alaska", due_date_reminder_interval: 0)
    ticket = Ticket.new
    ticket.title = "Ticket one"
    ticket.description = "new ticket"
    ticket.user_id = @user.id
    ticket.due_date = Time.now.to_date
    assert ticket.save
  end

  test "should not save a ticket without a title" do
    ticket = Ticket.new
    ticket.description = "new ticket"
    ticket.user_id = @user.id
    assert_not ticket.save, "Saved the ticket without a title"
  end

end
