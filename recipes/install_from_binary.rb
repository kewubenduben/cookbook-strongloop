ark "strongloop" do
 url node['strongloop']['binary']
 version node['strongloop']['version']
 checksum node["strongloop"]["checksums"][File.basename(node['strongloop']['binary'])]
 append_env_path true
 action :install
end
