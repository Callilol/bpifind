# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Bpifind::Application.initialize!

my_date_formats = { :default => '%d/%m/%Y' } 
Date::DATE_FORMATS.merge!(my_date_formats)
my_time_formats = { :default => '%d/%m/%Y %H:%M' }
Time::DATE_FORMATS.merge!(my_time_formats) 
