#!/bin/bash -e

# Import helpers
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "${SCRIPT_DIR}/helpers.sh"

if ! exists blackbox_whatsnew; then
  git clone https://github.com/StackExchange/blackbox.git /tmp/blackbox
  (cd /tmp/blackbox && sudo make copy-install)
  rm -rf /tmp/blackbox
fi

if ! exists envchain; then
  git clone https://github.com/sorah/envchain.git /tmp/envchain
  (cd /tmp/envchain && make && sudo make install)
  rm -rf /tmp/envchain
fi

if ! exists tfenv; then
  TFENV_DIR="${HOME}/.tfenv"
  if [ ! -d "${TFENV_DIR}" ]; then
    git clone https://github.com/tfutils/tfenv.git "${TFENV_DIR}"
  fi
  sudo ln -s ${TFENV_DIR}/bin/* /usr/local/bin
  tfenv install latest
fi
