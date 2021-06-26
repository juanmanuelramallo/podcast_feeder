class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank? && options[:allow_blank]
    return if value.match?(URI::regexp)

    record.errors.add(attribute, 'is not a valid URL')
  end
end
