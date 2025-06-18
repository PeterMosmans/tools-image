#!/usr/bin/env bash

# Test harness for tools-image
#
# shellcheck disable=SC2034,SC2317

# Stop as soon as an error is encountered
set -euo pipefail

# Use nice colors in the terminal output

COL_BLUE="\033[134m"
COL_BOLD="\033[1m"
COL_GREEN="\033[32m"
COL_RED="\033[031m"
COL_RESET="\033[0m"
COL_YELLOW="\033[033m"

check_outdated() {
  echo -e "${COL_BOLD}Installed Python packages:${COL_RESET}"
  pip list
  echo -e "${COL_BOLD}Outdated Python packages:${COL_RESET}"
  pip list --outdated
}

check_versions() {
  echo -e "${COL_BOLD}Check installed versions:${COL_RESET}"
  ansible-lint --version \
    && curl --version \
    && cyclonedx-py --help \
    && detect-secrets --version \
    && grype --version
  jwt_tool.py -h \
    && nikto.pl -Version \
    && nmap --version \
    && pylint --version \
    && sonar-scanner --version \
    && ssh-audit --help \
    && yamllint --version
}

all_tests() {
  echo -e "Running all tests"
  check_versions
  check_outdated
  echo -e "${COL_GREEN}All tests ran successful${COL_RESET}"
}

if (($# > 0)); then
  if [[ $1 == --help ]]; then
    echo "Usage: "
    echo -e "${COL_YELLOW}--force${COL_RESET}	Don't fail tests, but continue"
    exit 0
  fi
  if [[ $1 == --force ]]; then
    echo -e "${COL_BOLD}Showing differences, not failing tests...${COL_RESET}"
    set +e
  fi
fi

all_tests

exit 0
