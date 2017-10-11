class terraform_provider_alks (
  $version      = $::terraform_provider_alks::params::version,
  $platform     = $::terraform_provider_alks::params::platform,
  $arch         = $::terraform_provider_alks::params::arch,
) inherits ::terraform_provider_alks::params {

  include wget
  class { 'terraform_provider_alks::fetch':
    version  => $version,
    platform => $platform,
    arch     => $arch,
  }
  include terraform_provider_alks::install

}
