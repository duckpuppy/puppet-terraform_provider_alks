require 'spec_helper'

describe 'terraform_provider_alks::fetch' do
  let(:params) do
    {
      :base_url  => 'https://github.com/Cox-Automotive/terraform-provider-alks/releases/download/0.9.0',
      :base_name => 'terraform-provider-alks-linux-amd64',
      :extension => '.tar.gz'
    }
  end

  let(:expected_url) do
    [
      'https://github.com/Cox-Automotive/terraform-provider-alks/releases/download/',
      '0.9.0/terraform-provider-alks-linux-amd64.tar.gz'
    ].join
  end

  it { should contain_wget__fetch('alks_file_url').with_source(expected_url) }
end
