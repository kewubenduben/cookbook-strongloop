case node['platform_family']
  when 'debian'
    install_command = "dpkg -i --root='#{node[strongloop][dir]}'"
    not_if_command = "dpkg --list 2>&1 | grep strongloop | grep #{node[strongloop][version]}"
  when 'rhel'
    install_command = "rpm -Uvh --root='#{node[strongloop][dir]}'"
    not_if_command = "rpm -qa 2>&1 | grep strongloop | grep #{node[strongloop][version]}"
  else
    Chef::Log.error "There are no strongloop packages for this platform; please use the source or binary method to install node"
    return
end

bash "install-node" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
     #{install_command} "#{::File.basename(node[strongloop][package])}"
  EOH
  action :nothing
  not_if not_if_command
end

remote_file "#{Chef::Config[:file_cache_path]}/#{::File.basename(node['strongloop']['package'])}" do
  source node['strongloop']['package']
  checksum node["strongloop"]["checksums"][File.basename(node['strongloop']['package'])]
  notifies :run, resources(:bash => "install-node"), :immediately
end
