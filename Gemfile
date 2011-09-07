source 'http://rubygems.org'

# rails related gems
gem 'rails', '3.0.9'
gem 'database_cleaner', :group => :test
gem 'factory_girl_rails', :group => :test
gem 'cucumber-rails', :group => :test
gem 'capybara', :group => :test

# mongodb related gems
gem 'mongoid' # orm
gem 'bson_ext' # faster bson implementation
gem 'carrierwave'
gem 'carrierwave-mongoid', :require => "carrierwave/mongoid", :git => "https://github.com/jnicklas/carrierwave-mongoid.git"

# devise related
gem 'devise'

# tagging
gem "mongoid-simple-tags", "0.0.2"

# pagination
gem 'kaminari'

gem 'tiny_mce'

# testing
gem 'rspec-rails', :group => [:development, :test]
group :test do
  gem 'shoulda-matchers'
  gem 'mongoid-rspec'
end
