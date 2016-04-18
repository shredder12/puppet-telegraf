# == Class: telegraf::config
#
# only values which are effectivly changed will be managed
#
# More information on these settings available at:
#    https://github.com/influxdb/telegraf
#
# DO NO CALL DIRECTLY
class telegraf::config {

  $cfg = $::telegraf::cfg
  file { $telegraf::config_file:
    ensure  => file,
    content => inline_template("<%= require 'toml'; TOML::Generator.new(@cfg).body %>\n"),
    mode    => '0640',
    owner   => 'root',
    group   => 'telegraf',
  }

}
