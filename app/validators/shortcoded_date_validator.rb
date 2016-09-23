#
# Short Coded Date Validator Validator by Frank Rietta
# (C) 2014 Rietta Inc. All Rights Reserved.
# Licensed under terms of the BSD License.
#
# To use in a validation, add something like this to your model:
#
#   validates :due_at, :shortcoded_date => true
#
class ShortcodedDateValidator < ActiveModel::EachValidator

  def acceptable_date_format?(dv)
    dv = dv.to_s.strip.downcase
    if ((dv =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}\Z/) != nil)
      true
    elsif ((dv =~ /\A[0-9]+[d]\Z/) != nil)
      true
    elsif ((dv =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2}\Z/) != nil)
      true
    else
      false
    end
  end

  def validate_each(record, attribute, value)
    if value.nil?
      # Good, empty
    elsif (value.respond_to?(:acts_like_date?) and value.acts_like_date?)
      # Good
    elsif acceptable_date_format?(value)
      # Good
    else
      # Not good
      record.errors[attribute] << (options[:message] || "is not a date in an acceptable format. Must be one of 01/01/15, 01/01/2015)")
    end
  end # validate_each

end # shortcoded_date
