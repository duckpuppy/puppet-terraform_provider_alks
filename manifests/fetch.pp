class terraform_provider_alks::fetch (
  $base_url  = $terraform_provider_alks::releases_url,
  $base_name = $terraform_provider_alks::base_name,
  $extension = $terraform_provider_alks::extension,
){
  $file_name = "${base_name}${extension}"
  $file_url  = "${base_url}/${file_name}"

  wget::fetch { 'alks_file_url':
    source      => $file_url,
    destination => "/tmp/${file_name}",
    timeout     => 600,
    verbose     => true,
  }
}
