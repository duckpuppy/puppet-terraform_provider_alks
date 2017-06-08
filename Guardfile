scope group: :spec

group :spec do
  guard :rake, :task => 'test' do
    watch(%r{^spec\/.+\.rb$})
    watch(%r{^manifests\/.+\.pp$})
  end
end
