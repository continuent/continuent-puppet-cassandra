class cassandra (
  $version = '2.0.6',
) {
  include cassandra::core
  include cassandra::packages
}
