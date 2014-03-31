# Base server installation for Cassandra server. 
class cassandra::core (
  $version = '2.0.6',
) {
  # Ensure cassandra group and account are created. 
  group { 'cassandra':
    ensure => present
  } ->
  user { 'cassandra':
    ensure => present,
    shell => '/bin/bash',
    gid => 'cassandra',
    home => '/home/cassandra',
    managehome => true
  } ->
  # Copy in profile. 
  file { '/home/cassandra/.bash_profile':
    ensure => present,
    source => 'puppet:///modules/cassandra/cassandra.bash_profile',
    owner => 'cassandra',
    group => 'cassandra',
    mode => '755'
  } ->

  # Create the release directory with generic link. 
  exec { 'reldir':
    command => '/bin/tar xzf /vagrant/downloads/apache-cassandra-2.0.6-bin.tar.gz',
    cwd => '/opt/',
    creates => '/opt/apache-cassandra-2.0.6'
  } ->
  file { '/opt/cassandra':
    ensure => link,
    target => '/opt/apache-cassandra-2.0.6'
  } ->

  # Ensure correct permissions. 
  file { '/opt/apache-cassandra-2.0.6':
    #require => 'reldir',
    ensure => directory,
    owner => 'cassandra',
    group => 'cassandra',
    recurse => true
  } ->

  # Create log, pid, and data directories. 
  file { '/var/log/cassandra':
    ensure => directory,
    owner => 'cassandra',
    group => 'cassandra',
    recurse => true
  } ->
  file { '/var/run/cassandra':
    ensure => directory,
    owner => 'cassandra',
    group => 'cassandra',
    recurse => true
  } ->
  file { '/var/lib/cassandra':
    ensure => directory,
    owner => 'cassandra',
    group => 'cassandra',
    recurse => true
  } ->

  # Copy in cassandra configuration file. 
  file { '/opt/apache-cassandra-2.0.6/conf/cassandra.yaml':
    ensure => present,
    content => template('cassandra/cassandra.yaml.erb'),
    owner => 'cassandra',
    group => 'cassandra'
  } ->

  # Copy in start script. 
  file { '/etc/init.d/cassandra':
    ensure => present,
    source => 'puppet:///modules/cassandra/cassandra.initd',
    owner => 'cassandra',
    group => 'cassandra',
    mode => '755'
  } ->

  # Ensure we have a service. 
  service { 'cassandra':
    name      => 'cassandra',
    ensure    => running,
    enable    => true,
    subscribe => File['/opt/apache-cassandra-2.0.6/conf/cassandra.yaml']
  }
}
