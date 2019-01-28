require 'spec_helper'

describe 'terraform_provider_alks::install' do
  let(:pre_condition) do
    [
      'include terraform_provider_alks::fetch',
      'include terraform_provider_alks::params'
    ]
  end

  context 'zip file' do
    let(:params) { { :file_name => 'file.zip' } }

    it { is_expected.to contain_exec('alks_unpack')
          .with( :command => 'unzip -o /tmp/file.zip')
    }
  end

  context 'tar.gz file' do
    let(:params) { { :file_name => 'file.tar.gz' } }

    context 'renaming file' do
      before { params.merge! rename: true }

      it { is_expected.to contain_exec('alks_unpack')
            .with( :command => 'tar --transform=\'s/terraform-provider-alks(.*)?/terraform-provider-alks/x\' -zxvf /tmp/file.tar.gz')
      }
    end

    context 'not renaming file' do
      before { params.merge! rename: false }

      it { is_expected.to contain_exec('alks_unpack')
            .with( :command => 'tar -zxvf /tmp/file.tar.gz')
      }
    end

    context 'with default location' do
      it { is_expected.to contain_exec('alks_unpack')
            .with( :cwd => '/usr/bin' )
      }
    end

    context 'with specified location' do
      before { params.merge! location: '/foo/bar' }
      it { is_expected.to contain_exec('alks_unpack')
            .with( :cwd => '/foo/bar' )
      }
    end
  end
end
