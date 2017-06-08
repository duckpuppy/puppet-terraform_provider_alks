class terraform_provider_alks::install (
  $file_name = $terraform_provider_alks::fetch::file_name
){
  if $file_name =~ /^.*\.zip/ {
    exec { 'alks_unpack':
      command     => "unzip -o /tmp/${file_name}",
      cwd         => '/usr/bin',
      path        => ['/bin', '/usr/bin', '/usr/local/bin'],
      refreshonly => true,
      notify      => File['alks_cleanup_file'],
      require     => Class['terraform_provider_alks::fetch'],
    }
  } elsif $file_name =~ /^.*\.tar\.gz/ {
    exec { 'alks_unpack':
      command     => "tar zxf /tmp/${file_name} --strip-components 1",
      cwd         => '/usr/bin',
      path        => ['/bin', '/usr/bin', '/usr/local/bin'],
      refreshonly => true,
      notify      => File['alks_cleanup_file'],
      require     => Class['terraform_provider_alks::fetch'],
    }
  }

  file { 'alks_cleanup_file':
    ensure => absent,
    backup => false,
    path   => "/tmp/${file_name}",
  }
}
