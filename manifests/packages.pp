# Packages required to work with Cassandra.  
class cassandra::packages {
  # Following packages are required to install the Cassandra ruby gem. 
  # They must be installed in order to avoid errors, since cassandra gem
  # must compile code. 
  package {'make':
    ensure => installed
  }
  ->
  package {'gcc':
    ensure => installed
  }
  ->
  package {'ruby-devel':
    ensure => installed
  }
  ->
  package {'rubygem-rake.noarch':
    ensure => installed
  }
  ->
  package {'cassandra':
    require => Package['rubygem-rake.noarch'],
    ensure => installed,
    provider => 'gem'
  }
  package {'cassandra-cql':
    require => Package['rubygem-rake.noarch'],
    ensure => installed,
    provider => 'gem'
  }
}
