include docker
class {
  manage_package              => true,
  use_upstream_package_source => false,
  package_engine_name         => 'docker-engine',
  package_source_location     => 'https://download.docker.com/linux/centos/8/x86_64/nightly/Packages/containerd.io-1.4.9-3.1.el8.x86_64.rpm',
  prerequired_packages        => [ 'glibc.i686', 'glibc.x86_64', 'sqlite.i686', 'sqlite.x86_64', 'device-mapper', 'device-mapper-libs', 'device-mapper-event-libs', 'device-mapper-event' ]
}
