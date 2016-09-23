# Supported formats are:
# 1. mm/dd/yyyy
# 2. mm/dd/yy
module Dates::UsDate

  def parse_date(dv)
    if dv.nil? or "" == dv
      nil
    elsif dv.respond_to?(:acts_like_date?) and dv.acts_like_date?
      dv.to_date
    else
      parse_pretty_date_helper(dv.to_s.strip.downcase)
    end
  end # parse_pretty_date

  def days_since_helper(from_date)
    from_date ? (Date.today - from_date.to_date).round(0) : 0
  end

  private

  def parse_pretty_date_helper(dv)
    begin
      if (dv =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}\Z/) != nil
        # US Customary Format with Four Digit Year
        Date.strptime(dv, "%m/%d/%Y")
      elsif (dv =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2}\Z/) != nil
        # US Customary Format with 2 Digit Year
        Date.strptime(dv, "%m/%d/%y")
      elsif (dv =~ /\A[0-9]{1,2}-[0-9]{1,2}-[0-9]{4}\Z/) != nil
        # US Customary Format with Four Digit Year
        Date.strptime(dv, "%m-%d-%Y")
      elsif (dv =~ /\A[0-9]{1,2}-[0-9]{1,2}-[0-9]{2}\Z/) != nil
        # US Customary Format with 2 Digit Year
        Date.strptime(dv, "%m-%d-%y")
      else
        nil
      end
    rescue
    end
  end

end # UsDate
