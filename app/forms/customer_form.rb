class CustomerForm
  include ActiveModel::Model
  STATUSES = ['Active', 'Inactive', 'Closed']

  attr_accessor :name, :email, :phone, :note, :status
  validates :email, :name, :phone , presence: true
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
      customer = Customer.create!(name: name, email: email, phone: phone, note: note, status: status)
    end
end
