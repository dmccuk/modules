# == Class: load_balancer
#
# Full description of class load_balancer here.
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
#  class { 'load_balancer':
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
class load_balancer {

  file { '/etc/nginx/conf.d/load-balancer.conf':
    ensure  => 'file',
    group   => '0',
    mode    => '644',
    owner   => '0',
    content  => template("load_balancer/load_balancer.erb"),
    notify  => Service['nginx'],
  }
  exec { "remove file":
    path    => ['/usr/bin','/usr/sbin','/bin','/sbin'],
    command => "rm /etc/nginx/sites-enabled/default",
    require => File["/etc/nginx/conf.d/load-balancer.conf"],
    notify  => Service['nginx'],
}


}
