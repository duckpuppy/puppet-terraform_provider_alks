class terraform_provider_alks::fetch (
  $version = $::terraform_provider_alks::params::version,
  $platform = $::terraform_provider_alks::params::platform,
  $arch = $::terraform_provider_alks::params::arch,
){
  $extension = '.tar.gz'
  $base_name = "terraform-provider-alks-${platform}-${arch}"
  $base_url  = "https://github.com/Cox-Automotive/terraform-provider-alks/releases/download/${version}"
  $file_name = "${base_name}${extension}"
  $file_url  = "${base_url}/${file_name}"

  wget::fetch { 'alks_file_url':
    source      => $file_url,
    destination => "/tmp/${file_name}",
    timeout     => 600,
    verbose     => true,
  }
}
