#!/usr/bin/env bash

set -Eeuo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

mkdir -p /var/lib/lightmeter_workspace
touch $script_dir/.env
docker-compose up -d

cat <<-EOF >"/etc/apache2/ucs-sites.conf.d/lightmeter.conf"

###################################################################
# generated by lightmeter app join script, do not edit manually  #
###################################################################

ProxyPass /lightmeter/ http://127.0.0.1:8088/ retry=0

EOF

invoke-rc.d apache2 reload

