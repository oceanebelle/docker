#!/bin/bash

set -e

ACTION=$1

case $ACTION in
    PRINT_VERSION)
          echo "Printing version. Parameters $@"
          java -version
          ;;
    java)
          echo "Running java command: $@"
          command="$@"
          eval $command
          ;;
    *)
          env
          echo "Entrypoint is not configured $@. Replace entrypoint if required."
          ;;
esac


