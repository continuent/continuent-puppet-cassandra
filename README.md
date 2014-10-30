# continuent-tungsten

## About

This module helps install [Apache Cassandra] (http://cassandra.apache.org/) clusters.  It depends on the Tungsten puppet module to help do basic host setup. 

## Authors

* Robert Hodges

## Requirements

* Puppet = 3.2.7

## Limitations

* This is a prototype with limited OS support and parameterization

## Getting started. 

Follow directions in the main README for continuent-vagrant.  Then from the 
top-level continuent-vagrant directory do the following: 

    cp modules/cassandra/examples/Cassandra/default.pp manifests
    cd downloads
    wget http://mirror.tcpdiag.net/apache/cassandra/2.0.6/apache-cassandra-2.0.6-bin.tar.gz

After this you can run the launch.sh script as usual. 

## Examples

### Install the module into your module directory

    puppet module install continuent/cassandra
    
### Install Cassandra cluster using Tungsten to set up host configuration. 

Put this in your manifests/default.pp file:  

    # Install hosts and configure keys. 
    class { 'tungsten' :
	    installSSHKeys => true,
    }
    
    # Install and bring up Cassandra. 
    class { 'cassandra' :
    } -> Class['tungsten']

### Notes

Here is how to apply the Cassandra puppet module after installation.  

    puppet apply --modulepath=$PWD/modules manifests/default.pp [--verbose]
