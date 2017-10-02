#!/bin/bash

set -e

source $(dirname $0)/helpers.sh

it_can_put_and_set_git_config() {
  #local repo1=$(init_repo)
  #local src=$(mktemp -d $TMPDIR/put-src.XXXXXX)
  #put_uri_with_config $repo1 $src repo | jq -e "
    #.version == {checksum: $(echo none | jq -R .)}
  #"
  #echo --DONE
}

run it_can_put_and_set_git_config
