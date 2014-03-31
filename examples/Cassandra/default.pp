import 'vagrant_hosts.pp'

# Install hosts and configure keys. 
class { 'tungsten' :
	installSSHKeys => true,
}

# Install and bring up Cassandra. 
class { 'cassandra' :
} -> Class['tungsten']
