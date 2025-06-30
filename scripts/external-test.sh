#!/bin/bash

###############################################################################
# Script name:    external-test.sh
# Description:    External Host Connectivity Script
# Author:         Brian Geis
# GitHub:         https://github.com/briangeis/cisco-enterprise-gns3-network
# Copyright:      GNU General Public License v3.0
###############################################################################

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
  local host
  for host in "${!hosts[@]}"; do
    local ip="${hosts[$host]}"
    printf "Testing ping connectivity to %s (%s)... " "${host}" "${ip}"
    if ping -c1 -W1 "${ip}" &>/dev/null; then
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
    if curl -s --output /dev/null --connect-timeout 5 "${url}"; then
      printf "OK\n"
    else
      printf "FAILED\n"
    fi
  done

  # Perform DNS resolution test
  printf "Testing DNS resolution for %s..." "${domain}"
  if dig +short "${domain}" &>/dev/null; then
    printf "OK\n"
  else
    printf "FAILED\n"
  fi
}

main "$@"
