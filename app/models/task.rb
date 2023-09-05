class Task < ApplicationRecord
  validates :title, presence: true
  # validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  # after_create_commit -> { broadcast_prepend_later_to "tasks" }
  # after_update_commit -> { broadcast_replace_later_to "tasks" }
  # after_destroy_commit -> { broadcast_remove_to "tasks" }
  broadcasts_to ->(task) { [task.company, "tasks"] }, inserts_by: :prepend

  belongs_to :company
  has_many :line_item_dates, dependent: :destroy

end
