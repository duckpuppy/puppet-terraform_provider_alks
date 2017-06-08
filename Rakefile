require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.ignore_paths = ["vendor/**/*.pp", "spec/**/*.pp", "pkg/**/*.pp"]


desc 'Run syntax, lint, spec and metadata tests'
task :test => [
  :syntax,
  :lint,
  :spec,
]
