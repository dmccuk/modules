# == Class: webapp
#
# Full description of class webapp here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'webapp':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class webapp {

 package { 'nginx':
    ensure => 'installed',
  }

 service { 'nginx':
    ensure  => 'running',
    enable  => true,
    require => Package['nginx'],
  }

  file { '/usr/share/nginx/html/index.html':
    ensure  => 'file',
    group   => '0',
    mode    => '644',
    owner   => '0',
    content  => template("webapp/webapp.erb"),
    notify  => Service['nginx'],
  }

}
