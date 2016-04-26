# Load the Rails application.
require File.expand_path('../application', __FILE__)
# Initialize the Rails application.
Rails.application.initialize!
Rails.logger = Le.new('c60e1f2a-01ca-480f-8db4-270e2e04bdfb', :debug => true, :local => true)

