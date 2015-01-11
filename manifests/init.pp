class cassandra (
  $version = '2.1.2',
  $cluster_name = 'Continuent Cassandra Test',
  $seeds = 'db1'
) {
  include cassandra::core
  include cassandra::packages
}
