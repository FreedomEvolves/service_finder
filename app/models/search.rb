class Search
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :range, :starting_date, :specialty, :category, :service, :radius_miles, :city, :state, :country

  def initialize(attributes = {})
    if nil != attributes
      attributes.each do |key, value|
        self.send("#{key}=", value)
      end
      @attributes = attributes
    end
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end

  def to_key; end

  def save
  end

  def persisted?
    false
  end
end
