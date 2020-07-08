on_chroot << EOF
  # need to rehash because of https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=923479
  # found solution at https://github.com/balena-io-library/base-images/issues/562#issuecomment-511506804
  c_rehash /etc/ssl/certs
EOF
