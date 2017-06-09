class terraform_provider_alks::install (
  $file_name = $terraform_provider_alks::fetch::file_name
){
  if $file_name =~ /^.*\.zip/ {
    $unpack_cmd = "unzip -o /tmp/${file_name}"
  } elsif $file_name =~ /^.*\.tar\.gz/ {
    $unpack_cmd = "tar zxf /tmp/${file_name}"
  }

  exec { 'alks_unpack':
    command => $unpack_cmd,
    cwd     => '/usr/bin',
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
