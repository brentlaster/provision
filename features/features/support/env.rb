require 'aruba/cucumber'
Before do
# Set a longer timeout for aruba
  @aruba_timeout_seconds = 460
end
