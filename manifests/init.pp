class terraform_provider_alks (
  $version      = $::terraform_provider_alks::params::version,
  $platform     = $::terraform_provider_alks::params::platform,
  $arch         = $::terraform_provider_alks::params::arch,
  $releases_url = $::terraform_provider_alks::params::releases_url,
  $base_name    = $::terraform_provider_alks::params::base_name,
  $extension    = $::terraform_provider_alks::params::extension,
) inherits ::terraform_provider_alks::params {

  include wget
  include terraform_provider_alks::fetch
  include terraform_provider_alks::install

}
