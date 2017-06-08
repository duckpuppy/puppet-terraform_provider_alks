fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

require 'mocha'
require 'puppet'
require 'rspec-puppet'

RSpec.configure do |c|
  c.mock_with :mocha
  c.module_path = File.join(fixture_path, 'modules')
  c.manifest_dir = File.join(fixture_path, 'manifests')
  c.environmentpath = File.join(Dir.pwd, 'spec')
end
