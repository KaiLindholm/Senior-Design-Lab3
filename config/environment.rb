# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load environment variables from .env file
require 'dotenv'
Dotenv.load

# Initialize the Rails application.
Rails.application.initialize!

