remote_file "#{node['gerrit']['install_dir']}/plugins/rabbitmq.jar" do
  source "https://github.com/rinrinne/gerrit-rabbitmq-plugin/releases/download/rabbitmq-1.4/rabbitmq-1.4-2.8.5.jar"
  owner node['gerrit']['user']
  group node['gerrit']['group']
end

# read AMQP password from chef-vault
include_recipe "t3-chef-vault"
amqp_pass = chef_vault_password(node['site-reviewtypo3org']['amqp']['server'], node['site-reviewtypo3org']['amqp']['user'])


template "#{node['gerrit']['install_dir']}/etc/rabbitmq.config" do
  source "amqp-publisher/rabbitmq.config.erb"
  owner node['gerrit']['user']
  group node['gerrit']['group']
  variables(
    :amqp => {
      :uri => "amqp://#{node['site-reviewtypo3org']['amqp']['server']}/#{node['site-reviewtypo3org']['amqp']['vhost']}",
      :username => node['site-reviewtypo3org']['amqp']['user'],
      :password => amqp_pass
    }
  )
end