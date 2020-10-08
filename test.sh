#!/bin/sh

foo() {
  test "$1$2" = showGit/github.com
}

check_sneaky_paths() {
  return 0
}

export PROGRAM=foo

if echo host=github.com | bash ./git-helper.bash
then echo All good
else echo No good
exit 1
fi
