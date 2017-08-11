class Project < ApplicationRecord
  belongs_to :customer
  has_many :project_user_assignements
  has_many :users, through: :project_user_assignements
  has_many :tasks
end
