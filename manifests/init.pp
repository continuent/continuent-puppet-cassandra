class cassandra (
  $version = '2.0.6',
  $cluster_name = 'Continuent Cassandra Test',
  $seeds = 'db1'
) {
  include cassandra::core
  include cassandra::packages
}
