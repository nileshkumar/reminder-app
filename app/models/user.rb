class User < ApplicationRecord
  has_many :tickets
  
  validates :name, presence: true
  validates :mail, presence: true 
  validates :time_zone, presence: true
  validates :due_date_reminder_interval, presence: true
  validates_numericality_of :due_date_reminder_interval, :only_integer => true, :allow_nil => true, 
    :greater_than_or_equal_to => 0,
    :less_than_or_equal_to => 10,
    :message => "can only be whole number between 0 and 10"
end
