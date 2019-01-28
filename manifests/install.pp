class terraform_provider_alks::install (
  $file_name = $terraform_provider_alks::fetch::file_name,
  $location = $::terraform_provider_alks::params::location,
  $rename = $::terraform_provider_alks::params::rename,
){
  if $file_name =~ /^.*\.zip/ {
    $unpack_cmd = "unzip -o /tmp/${file_name}"
  } elsif $file_name =~ /^.*\.tar\.gz/ {
    if $rename == true {
      $tar_cmd = "tar --transform='s/terraform-provider-alks(.*)?/terraform-provider-alks/x'"
    } else {
      $tar_cmd = "tar"
    }
    $unpack_cmd = "${tar_cmd} -zxvf /tmp/${file_name}"
  }

  exec { 'alks_unpack':
    command => $unpack_cmd,
    cwd     => $location,
    path    => ['/bin', '/usr/bin', '/usr/local/bin'],
    notify  => File['alks_cleanup_file'],
    require => Class['terraform_provider_alks::fetch'],
  }

  file { 'alks_cleanup_file':
    ensure => absent,
    backup => false,
    path   => "/tmp/${file_name}",
  }
}
