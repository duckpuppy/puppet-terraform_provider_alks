# terraform-alks-provider
[![Build Status](https://travis-ci.org/duckpuppy/puppet-terraform-provider-alks.svg?branch=master)](https://travis-ci.org/duckpuppy/puppet-terraform-provider-alks)

## Usage

```shell
  include terraform_alks_provider
```

or

```shell
  class { 'terraform_alks_provider':
    version  => '0.9.0',
    platform => 'linux',
    arch     => 'amd64',
  }
```
