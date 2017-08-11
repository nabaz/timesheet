class ProjectForm
  include ActiveModel::Model
  STATUSES = ['Active', 'Inactive', 'Closed']

  attr_accessor :name, :description, :status, :customer, :user

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

  def users
    User.pluck(id, name)
  end

  private
    def persist!
      byebug
      project = Project.create!(
          name: name,
          description: description,
          status: status,
          customer: Customer.find(customer),
          users: User.find(user)
        )
    end
end
