# continuent-tungsten

## About

This module helps install [Apache Cassandra] (http://cassandra.apache.org/) clusters.  It depends on the Tungsten puppet module to help do basic host setup. 

## Authors

* Robert Hodges

## Requirements

* Puppet = 3.2.7

## Limitations

* This is a prototype with limited OS support and parameterization

## Examples

### Install the module into your module directory

    puppet module install continuent/cassandra
    
### Install Cassandra cluster using Tungsten to set up host configuration. 

    # Install hosts and configure keys. 
    class { 'tungsten' :
	    installSSHKeys => true,
    }
    
    # Install and bring up Cassandra. 
    class { 'cassandra' :
    } -> Class['tungsten']
