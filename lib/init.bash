#!/bin/bash

# Make sure $SCRIPT_NAME is set appropriately
SCRIPT_NAME="${0##*/}"

## {{{ info()
function info()
{
  echo ">>" "$@"
}
## }}}

## {{{ error()
function error()
{
  echo >&2 "$SCRIPT_NAME: error:" "$@"
}
## }}}

## {{{ die()
function die()
{
  error "$@"
  exit 1
}
## }}}

## {{{ debug()
function debug()
{
  [[ $DEBUG -eq 1 ]] && echo >&2 "DEBUG:" "$@"
}
## }}}

## Set global variables
#

if [[ x$DEBUG == x ]]
then
  export DEBUG=0
else
  case "x$DEBUG" in
    x0|x1)
      ;;
    *)
      die "DEBUG environment must be set to either 0 or 1"
      ;;
  esac
fi

PD_BIN_DIR="$(realpath "$(dirname "$0")")"
debug "PD_BIN_DIR=$PD_BIN_DIR"

PD_ROOT_DIR="$(dirname "$PD_BIN_DIR")"
debug "PD_ROOT_DIR=$PD_ROOT_DIR"

PD_LIB_DIR="$PD_ROOT_DIR/lib"
debug "PD_LIB_DIR=$PD_LIB_DIR"

PD_TMP_DIR="$PD_ROOT_DIR/tmp"
debug "PD_TMP_DIR=$PD_TMP_DIR"

PD_INSTANCE_DIR="$(dirname "$PD_ROOT_DIR")"
debug "PD_INSTANCE_DIR=$PD_INSTANCE_DIR"

## Initialisation
#

if [[ ! -d $PD_TMP_DIR ]]
then
  debug "Creating $PD_TMP_DIR"
  mkdir -m0700 "$PD_TMP_DIR" || die "$PD_TMP_DIR: mkdir failed"
fi

# Source in instance-local config
[[ -f $PD_INSTANCE_DIR/.packdev.env ]] && source "$PD_INSTANCE_DIR/.packdev.env"

##
# vim: ts=2 sw=2 et fdm=marker :
##
