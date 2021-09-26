include docker
class { 'docker':
  use_upstream_package_source => false,
  repo_opt => '',
}
