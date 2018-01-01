# Puppet Strings Wrapper

A wrapper to use [puppet-strings](https://github.com/puppetlabs/puppet-strings) module outside of the puppet itself. [traveling-ruby](https://github.com/phusion/traveling-ruby) is used to deploy the wrapper in totally independed directory.

## Setup

```
./setup-osx.sh <path where to deploy the wrapper>
```

After setup, the wrapper would be able to generate json documents.

This puppet's method:

`puppet strings generate '*/manifests/**/*.pp' '*/functions/**/*.pp' --emit-json out.json`

Can now be called in that way:

`./<path>/puppet-strings '["*/manifests/**/*.pp", "*/functions/**/*.pp"]' out.json`
