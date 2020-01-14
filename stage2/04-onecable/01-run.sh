on_chroot << EOF
  # need to rehash because of https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=923479
  # found solution at https://github.com/balena-io-library/base-images/issues/562#issuecomment-511506804
  c_rehash /etc/ssl/certs

  # install docker
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
  if [ ! -f /usr/bin/docker ] ; then
      curl -sSL https://get.docker.com | sh
  fi

  systemctl disable docker
  systemctl disable containerd

  # install k3s
  # can't use install script, as systemd is not recognized
  # installing binary manually
  curl -sSL https://github.com/rancher/k3s/releases/download/v1.17.0%2Bk3s.1/k3s-arm64 > /usr/local/bin/k3s
EOF
