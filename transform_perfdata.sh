#!/bin/bash
carbon_host=192.168.2.6
carbon_port=2003
awk_script="/usr/local/lib/transform_perfdata.awk"

tmpfile="$(mktemp)"
mv "$1" "${tmpfile}"
awk -f "${awk_script}"< "$tmpfile" > /dev/tcp/${carbon_host}/${carbon_port}
rm "${tmpfile}"
