#!/bin/bash
#
# cisco-enterprise-network
# https://github.com/briangeis/cisco-enterprise-network
#
# External Connectivity Test
# Verifies external host reachability via ping, HTTP, and DNS.
#
# Author:  Brian Geis
# License: GPL-3.0-or-later
#

main() {
  # Define the IP addresses of HTTP servers
  local -A hosts=(
    ["Server-01"]="172.20.1.3"
    ["Server-02"]="172.20.1.4"
    ["Server-03"]="172.20.1.5"
  )

  # Define the URLs of all HTTP servers
  local -A servers=(
    ["Server-01"]="http://172.20.1.3"
    ["Server-02"]="http://172.20.1.4"
    ["Server-03"]="http://172.20.1.5"
  )

  # Define the domain used for DNS testing
  local domain="github.com"

  # Perform ping connectivity tests
  local target
  for target in "${!hosts[@]}"; do
    local ip="${hosts[$target]}"
    printf "Testing ping connectivity to %s (%s)... " "${target}" "${ip}"
    if ping -c2 -W1 "${ip}" &>/dev/null; then
      printf "OK\n"
    else
      printf "FAILED\n"
    fi
  done

  # Perform HTTP connectivity tests
  local server
  for server in "${!servers[@]}"; do
    local url="${servers[$server]}"
    printf "Testing HTTP connectivity to %s (%s)... " "${server}" "${url}"
    if curl -sf --output /dev/null --connect-timeout 5 --max-time 10 "${url}"; then
      printf "OK\n"
    else
      printf "FAILED\n"
    fi
  done

  # Perform DNS resolution test
  printf "Testing DNS resolution for %s... " "${domain}"
  if host "${domain}" &>/dev/null; then
    printf "OK\n"
  else
    printf "FAILED\n"
  fi
}

main "$@"
