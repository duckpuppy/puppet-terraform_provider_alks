require 'spec_helper'

describe 'terraform_provider_alks::install' do
  let(:pre_condition) { 'include terraform_provider_alks::fetch' }

  context 'zip file' do
    let(:params) { { :file_name => 'file.zip' } }

    it { is_expected.to contain_exec('alks_unpack')
          .with( :command => 'unzip -o /tmp/file.zip')
    }
  end

  context 'tar.gz file' do
    let(:params) { { :file_name => 'file.tar.gz' } }

    it { is_expected.to contain_exec('alks_unpack')
          .with( :command => 'tar zxf --transform=\'s/terraform-provider-alks(.*)?/terraform-provider-alks/x\' /tmp/file.tar.gz')
    }
  end
end
