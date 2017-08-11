class TimeEntryForm
  include ActiveModel::Model

  attr_accessor :title, :task, :user, :start_time, :end_time, :description, :location

  validate :start_date_cannot_be_greater_than_end_dates
  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :description, presence: true

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  def start_date_cannot_be_greater_than_end_dates
    if start_time.present? && start_time > end_time
      errors.add(:start_time, "Can't be greater than end time")
    end
  end

  def calculate_hour
    end_time - start_time
  end

  private
    def persist!
      @task = Task.find(task)
        time_entry = TimeEntry.create!(
            title: title,
            description: description,
            task: @task,
            user: user,
            start_time: start_time,
            end_time: end_time,
            location: location
          )
  
    end
end
