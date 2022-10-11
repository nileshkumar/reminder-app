require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should save a user" do
    user = User.new
    user.name = "new user1"
    user.mail = "user@gmail.com"
    user.time_zone = "Vienna"
    user.due_date_reminder_interval = 1
    assert user.save
  end

  test "should not save a user" do
    user = User.new
    user.name = "new user"
    assert_not user.save, "Should not save the user"
  end
end
