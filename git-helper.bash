#!/bin/bash

if [[ $1 != get ]]
then exit 0
fi

while read -r this_line; do
  case $this_line in
    host=*)
      pass_entry="Git/${this_line#host=}"
      check_sneaky_paths "$path"
      $PROGRAM show "$pass_entry"
  esac
done
