class Ticket < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  enum :status_id, { open: 0, closed: 1 }
  enum :progress, { idle: 0, started: 1, done: 3 }

  delegate :name, :mail, :to => :user, prefix: :project_member
end
