include 'docker'

docker::image { 'centos':
   image_tag => 'nightly',
}
