class TaskForm
  include ActiveModel::Model
  STATUSES = ['Active', 'Inactive', 'Closed']

  attr_accessor :name, :description, :status, :project, :user
  validates :name, :description, presence: true
  validates_inclusion_of :status, in: STATUSES, allow_blank: true

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private
    def persist!
      task = Task.create!(
          name: name,
          description: description,
          status: status,
          project: Project.find(project),
          user: User.find(user)
        )
    end
end
