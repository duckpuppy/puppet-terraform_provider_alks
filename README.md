# terraform-alks-provider

[![Build Status](https://travis-ci.org/duckpuppy/puppet-terraform_provider_alks.svg?branch=master)](https://travis-ci.org/duckpuppy/puppet-terraform_provider_alks)

## Usage

```shell
  include terraform_provider_alks
```

or

```shell
  class { 'terraform_provider_alks':
    version  => '0.9.0',
    platform => 'linux',
    arch     => 'amd64',
  }
```
