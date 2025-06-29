#!/bin/bash

###############################################################################
# Script name:    internal-test.sh
# Description:    Internal Host Connectivity Script
# Author:         Brian Geis
# GitHub:         https://github.com/briangeis/cisco-enterprise-gns3-network
# Copyright:      GNU General Public License v3.0
###############################################################################

main() {
  # Define the IP addresses of all hosts
  local -A hosts=(
    ["Server-01"]="8.8.8.8"
    ["Server-02"]="8.8.8.8"
    ["Server-03"]="8.8.8.8"
    ["NetAdmin-PC"]="8.8.8.8"
    ["Sales-PC"]="8.8.8.8"
    ["Marketing-PC"]="8.8.8.8"
    ["Accounting-PC"]="8.8.8.8"
    ["Management-PC"]="8.8.8.8"
    ["Shipping-PC"]="8.8.8.8"
    ["Receiving-PC"]="8.8.8.8"
  )

  # Define the URLs of all HTTP servers
  local -A servers=(
    ["Server-01"]="https://github.com"
    ["Server-02"]="https://github.com"
    ["Server-03"]="https://github.com"
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
      printf "FAIL\n"
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
      printf "FAIL\n"
    fi
  done

  # Perform DNS resolution test
  printf "Testing DNS resolution for %s..." "${domain}"
  if dig +short "${domain}" &>/dev/null; then
    printf "OK\n"
  else
    printf "FAIL\n"
  fi
}

main "$@"
