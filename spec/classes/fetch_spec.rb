require 'spec_helper'

describe 'terraform_provider_alks::fetch' do
  let(:params) do
    {
      :version  => 'version',
      :arch     => 'arch',
      :platform => 'platform'
    }
  end

  let(:expected_url) do
    [
      'https://github.com/Cox-Automotive/terraform-provider-alks/releases/download/',
      'version/terraform-provider-alks-platform-arch.tar.gz'
    ].join
  end

  it { should contain_wget__fetch('alks_file_url').with_source(expected_url) }
end
