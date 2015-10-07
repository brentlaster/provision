require 'aruba/cucumber'
Aruba.configure do |config|
   config.exit_timeout = 60
end

Before do
   aruba.config.io_wait_timeout = 60
end
