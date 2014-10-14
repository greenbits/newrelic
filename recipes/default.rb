#
# Cookbook Name:: newrelic
# Recipe:: default
#
# Copyright 2012-2014, Escape Studios
#

if node['newrelic']['server_monitoring']['include_stack_name']
  stack_name_slug = node['opsworks']['stack']['name'].gsub('\s+', '-').gsub('[\(\)]', '')
  node.default['newrelic']['server_monitoring']['hostname'] =
    "#{node['opsworks']['instance']['hostname']}-#{stack_name_slug}"
end
include_recipe 'newrelic::server_monitor_agent'
