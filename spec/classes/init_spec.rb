require 'spec_helper'
describe 'terraform_provider_alks' do
  let (:facts) {{
    'kernel' => 'Linux'
  }}

  context 'with defaults for all parameters' do
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('terraform_provider_alks') }
    it { is_expected.to contain_class('terraform_provider_alks::fetch') }
    it { is_expected.to contain_class('terraform_provider_alks::install') }
    it { is_expected.to contain_class('terraform_provider_alks::params') }
  end
end
