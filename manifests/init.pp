class terraform_provider_alks (
  $version      = $::terraform_provider_alks::params::version,
  $platform     = $::terraform_provider_alks::params::platform,
  $arch         = $::terraform_provider_alks::params::arch,
  $location     = $::terraform_provider_alks::params::location,
  $rename       = $::terraform_provider_alks::params::rename
) inherits ::terraform_provider_alks::params {

  include wget
  class { 'terraform_provider_alks::fetch':
    version  => $version,
    platform => $platform,
    arch     => $arch,
  }

  class { 'terraform_provider_alks::install':
    location => $location,
    rename   => $rename
  }
}
