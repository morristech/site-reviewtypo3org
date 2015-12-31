default['gerrit']['version'] = "2.12"

default['git']['hostname'] = "dev.git.typo3.org"
default['git']['hostname'] = "git.typo3.org" if node.chef_environment == "production"

default['gerrit']['config']['gerrit']['canonicalWebUrl'] = "https://#{node['gerrit']['hostname']}/"
default['gerrit']['config']['database']['type'] = "MYSQL"
default['gerrit']['config']['database']['database'] = "gerrit"
default['gerrit']['config']['auth']['type'] = "HTTP"
default['gerrit']['config']['auth']['cookieSecure'] = true
default['gerrit']['config']['auth']['gitBasicAuth'] = true
default['gerrit']['proxy']['ssl'] = true

default['gerrit']['batch_admin_user']['enabled'] = true
