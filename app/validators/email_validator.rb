class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value && value !~ /(.+)@(.+){2,}\.(.+){2,}/i
      record.errors.add attribute, (options[:message] || "is not valid email")
    end
  end
end
