ark "strongloop" do
 url node['strongloop']['binary']
 version node['strongloop']['version']
 checksum node["strongloop"]["checksums"][File.basename(node['strongloop']['binary'])]
 has_binaries %w{ bin/slc bin/slnode bin/node }
 append_env_path true
 action :install
end
