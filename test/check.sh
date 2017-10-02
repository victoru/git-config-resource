#!/bin/bash

set -e

source $(dirname $0)/helpers.sh

it_can_check_and_set_git_config() {
  local repo=$(init_repo)
  local ref=$(make_commit $repo)

  cp ~/.gitconfig ~/.gitconfig.orig

  o=$(check_uri_with_config $repo)
  local checksum=$(sha1sum < ~/.gitconfig | awk '{print $1}')
  echo $o | jq -e "
    . == [{checksum: $(echo $checksum | jq -R .)}]
  "
  test "$(git config --global core.pager)" == 'true'
  test "$(git config --global credential.helper)" == '!true long command with variables $@'

  mv ~/.gitconfig.orig ~/.gitconfig
}

run it_can_check_and_set_git_config
