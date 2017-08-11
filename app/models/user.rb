class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
          :rememberable, :trackable, :validatable

  has_many :tasks
  has_many :project_user_assignements

  # filter :level, apply: ->(records, value, options) {
  #   if !(value - ['admin', 'manager', 'user']).empty?
  #     raise JSONAPI::Exceptions::InvalidFilterValue.new(:status, value)
  #   end
  # }

end
