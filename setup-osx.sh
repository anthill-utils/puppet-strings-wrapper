#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "Usage: build-osx.sh /path/to/puppet-strings-wrapper"
    exit 1
fi

mkdir tmp

DEPLOY=$1

echo "Installing puppet-strings wrapper into $DEPLOY ..."

curl -o tmp/traveling-ruby-osx.tar.gz http://d6r77u77i8pq3.cloudfront.net/releases/traveling-ruby-20150715-2.2.2-osx.tar.gz

mkdir $DEPLOY
cp src/osx/puppet-strings $DEPLOY/puppet-strings
mkdir $DEPLOY/lib
mkdir $DEPLOY/lib/app
cp src/osx/puppet-strings.rb $DEPLOY/lib/app/puppet-strings.rb
mkdir $DEPLOY/lib/ruby
tar -xzf tmp/traveling-ruby-osx.tar.gz -C $DEPLOY/lib/ruby

# rdoc doesn't want to install right the first time
$DEPLOY/lib/ruby/bin/gem install rdoc 2> /dev/null
$DEPLOY/lib/ruby/bin/gem install rdoc

$DEPLOY/lib/ruby/bin/gem install yard
$DEPLOY/lib/ruby/bin/gem install puppet
$DEPLOY/lib/ruby/bin/gem install puppet-strings
rm -rf tmp
