class terraform_provider_alks::params {
  $version      = '0.9.0'
  $platform     = 'linux'
  $arch         = 'amd64'
  $releases_url = "https://github.com/Cox-Automotive/terraform-provider-alks/releases/download/${version}"
  $base_name    = "terraform-provider-alks-${platform}-${arch}"
  $extension    = '.tar.gz'
}
