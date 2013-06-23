module Cleaner
  def self.clean_phone_number(phone_number)
    phone_number.to_s.gsub!(/[()-.' ',]/,'')
    phone_number = "NONE" if phone_number.length < 10
    phone_number.gsub!(/1/,'') if phone_number.start_with?('1')
    phone_number = "NONE" if phone_number.length > 10
    phone_number
  end

  def self.clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, '0').slice(0..4)
  end

  def self.clean_rsvp_date(rsvp_date)
    day, time = rsvp_date.to_s.split(' ')
    rsvp_date = { day: day, time: time }
  end
end