install -v -d					"${ROOTFS_DIR}/etc/dnsmasq.d"
install -v -m 600 files/usb	"${ROOTFS_DIR}/etc/dnsmasq.d/usb"

install -v -d					"${ROOTFS_DIR}/etc/network/interfaces.d"
install -v -m 600 files/usb0	"${ROOTFS_DIR}/etc/network/interfaces.d/usb0"

install -v -m 500 files/usb.sh	"${ROOTFS_DIR}/root/usb.sh"

on_chroot << EOF
  echo libcomposite >> /etc/modules

  # don't run dhcp on usb0
  echo "denyinterfaces usb0" >> /etc/dhcpcd.conf

  # need to rehash because of https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=923479
  # found solution at https://github.com/balena-io-library/base-images/issues/562#issuecomment-511506804
  c_rehash /etc/ssl/certs
EOF
