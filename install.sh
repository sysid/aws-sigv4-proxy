#!/usr/bin/env bash
################################################################################
# ./aws-sigv4-proxy -v --log-failed-requests --log-signing-process --no-verify-ssl --name es --region eu-central-1 --host localhost:8050 --sign-host eu-central-1.es.amazonaws.com
################################################################################

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

[ -f aws-sigv4-proxy ] && rm -v aws-sigv4-proxy
CGO_ENABLED=0 go build ./cmd/aws-sigv4-proxy  # see Dockerfile
pushd $HOME/bin
ln -svf $SCRIPT_DIR/aws-sigv4-proxy $HOME/bin/aws-sigv4-proxy
ls -al $HOME/bin/aws-sigv4-proxy
