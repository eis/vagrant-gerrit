node default {
  service {
    'iptables':
      ensure => stopped,
      enable => false,
  } ->
  class {
    '::mysql::server':
      root_password => 'strongpassword',
  } ->
  mysql::db {
    'gerritdb':
      user     => 'gerrit',
      password => 'strongerpassword',
      host     => 'localhost',
      charset  => 'latin1',
      collate  => 'latin1_swedish_ci',
  }
}
