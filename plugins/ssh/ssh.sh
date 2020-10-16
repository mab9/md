#!/bin/bash

FILE_DIRECTORY=`dirname "$0"`

function cisvc-local() {
  # sshgwcibe.ad.bedag.ch 172.29.58.157
  ip=172.29.58.157
  #result=$(curl ${ip})
  #if [[ $result == *"Could not resolve host"* ]]; then
  #  echo "Could not resolve ${ip}!"
  #  #return
  #fi
  ssh rb25@cisvc-local@${ip}
}

function instructions() {
  echo "Options:"
  echo "  -ci | --cisvc-local:         SSH to Bedag CI Segment"
  echo "        --help:                Show help"
  echo ""
  echo "Usage:"
  echo "  md ssh [Options]"
  echo ""
}

function error() {
  echo "Examples: md ssh -ci"
  echo ""
  instructions
}

function help() {
  echo "Help"
  echo ""
  instructions
}

function executeDefaults() {
  command="$2" # second layer

  case $command in
      --cisvc-local|-ci)
          cisvc-local
          ;;
      --help)
          help
          ;;
      *)
          error
          ;;
  esac
}

executeDefaults $@
