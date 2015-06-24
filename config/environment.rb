# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Register media type = all as twiml
Mime::Type.register "*/*", :twiml