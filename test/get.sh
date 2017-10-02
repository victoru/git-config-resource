#!/bin/bash

set -e

source $(dirname $0)/helpers.sh

it_can_get_and_set_git_config() {
  local repo=$(init_repo)
  local dest=$TMPDIR/destination

  mv ~/.gitconfig ~/.gitconfig.orig

  o=$(get_uri_with_config $repo $dest)
  local checksum=$(sha1sum < ~/.gitconfig | awk '{print $1}')
  echo $o | jq -e "
    .version == {checksum: $(echo $checksum | jq -R .)}
  "

  test "$(git config --global core.pager)" == 'true'
  test "$(git config --global credential.helper)" == '!true long command with variables $@'

  mv ~/.gitconfig.orig ~/.gitconfig
}

run it_can_get_and_set_git_config
