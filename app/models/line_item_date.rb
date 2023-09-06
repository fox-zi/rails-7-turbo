class LineItemDate < ApplicationRecord
  belongs_to :task

  validates :date, presence: true, uniqueness: { scope: :task_id }

  scope :ordered, -> { order(date: :asc) }

  has_many :line_items

  def previous_date
    task.line_item_dates.ordered.where("date < ?", date).last
  end
end
