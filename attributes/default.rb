default['nodejs']['version'] = '1.0.0-1'
default['nodejs']['dir'] = '/usr/local'
default['nodejs']['make_threads'] = node['cpu'] ? node['cpu']['total'].to_i : 2

case node['platform_family']
  when "debian"
    arch = node['kernel']['machine'] =~ /x86_64/ ? "amd64" : "i386"
    default['strongloop']['package'] = "http://45ec19d3127bddec1c1d-e57051fde4dbc9469167f8c2a84830dc.r36.cf1.rackcdn.com/strongloop-suite_#{default['nodejs']['version']}_#{arch}.deb"
    default['strongloop']['binary']  = "http://45ec19d3127bddec1c1d-e57051fde4dbc9469167f8c2a84830dc.r36.cf1.rackcdn.com/strongloop-suite_#{default['nodejs']['version']}_#{arch}.tgz"
  when "rhel"
    arch = node['kernel']['machine'] =~ /x86_64/ ? "x86_64" : "i686"
    default['strongloop']['package'] = "http://45ec19d3127bddec1c1d-e57051fde4dbc9469167f8c2a84830dc.r36.cf1.rackcdn.com/strongloop-suite-#{default['nodejs']['version']}.el6.#{arch}.rpm"
    default['strongloop']['binary']  = "http://45ec19d3127bddec1c1d-e57051fde4dbc9469167f8c2a84830dc.r36.cf1.rackcdn.com/strongloop-suite-#{default['nodejs']['version']}.el6.#{arch}.tgz"
  when "mac_os_x"
    default['strongloop']['package'] = "http://45ec19d3127bddec1c1d-e57051fde4dbc9469167f8c2a84830dc.r36.cf1.rackcdn.com/strongloop-suite-#{default['nodejs']['version']}.pkg"
  when "windows"
    arch = node['kernel']['machine'] =~ /x86_64/ ? "x64" : "x86"
    default['strongloop']['package'] = "http://45ec19d3127bddec1c1d-e57051fde4dbc9469167f8c2a84830dc.r36.cf1.rackcdn.com/strongloop-suite-#{default['nodejs']['version']}-#{arch}.msi"
end


default['strongloop']['checksums'] = {
  "strongloop-suite_1.0.0-1_amd64.deb" => "274acab7c7c515de3fccb1cadbffa7b40d2ed35386ddc299508646dde92facb1",
  "strongloop-suite_1.0.0-1_amd64.tgz" => "80a6a36ec400e7f7fd2787ad2080a1712132da40cc40237b06d986869a15ec5c",
  "strongloop-suite-1.0.0-1.el6.i686.rpm" => "d53a50668b57961af5f90daa932c55905e0c6caa9dc954c29f274d307eda8e77",
  "strongloop-suite-1.0.0-1.el6.i686.tgz" => "e0975443d4e966e117eba60ad56a17f543ae8b75b97bb7bdcb0535f94dab4052",
  "strongloop-suite-1.0.0-1.el6.src.rpm" => "6bb113d863955b2842e8600358e9f0699f449e2d65ac313e8ac50497ebfdd83a",
  "strongloop-suite-1.0.0-1.el6.x86_64.rpm" => "e04da015dc4fb8cb7a7e64febae3b564c0fcaf3cdc4513b3f94151b1082ad853",
  "strongloop-suite-1.0.0-1.el6.x86_64.tgz" => "2d9ef2cc07a7ee522898941f6919d557c21848f3f84a45675c59a44a9a4b2612",
  "strongloop-suite_1.0.0-1_i386.deb" => "3315025297be9e38e93533aaf7f7ae1ba67d5e9b047fbf2862e4c714f4faea6c",
  "strongloop-suite-1.0.0-1.pkg" => "64615fc0c6279c249bc3cc3e654a13ac541bb51f083a43562986c3c3c6725606",
  "strongloop-suite-1.0.0-1-x64.msi" => "52de046945fb6278b7d7de3e7d6a51847992b35aa9569161c8cbbe419821599b",
  "strongloop-suite-1.0.0-1-x86.msi" => "9d2eee712fbd227549ded37f1a208718cb81fcbfd3fdbf84b1ea43bbb3bbe2cb"
}

