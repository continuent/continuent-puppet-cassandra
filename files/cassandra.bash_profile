# .bash_profile for Cassandra account. 

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/bin

# Include path to Cassandra binaries. 
PATH=$PATH:/opt/cassandra/bin

export PATH

