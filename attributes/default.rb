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
  "strongloop-suite_1.0.0-1_amd64.deb" => "f80442c588564bf21a50b2cdb6b862a0134426d1",
  "strongloop-suite_1.0.0-1_amd64.tgz" => "9fb6ce3e780ec3d167b975d1a8ac32b989b347a4",
  "strongloop-suite-1.0.0-1.el6.i686.rpm" => "5562cd790ae11ec04473cf4a2ea7d081cfa2f1d7",
  "strongloop-suite-1.0.0-1.el6.i686.tgz" => "25c719e9252fd99caeb692524623e68fc6dfbc22",
  "strongloop-suite-1.0.0-1.el6.src.rpm" => "194ee90957a43aaa74aa8e042982b17cd412bb0c",
  "strongloop-suite-1.0.0-1.el6.x86_64.rpm" => "d0e5c1de258c7dacacdbd56c7eb98f16be822324",
  "strongloop-suite-1.0.0-1.el6.x86_64.tgz" => "93bb02c2eb26a0c6e747b7a3c2842f8e697776d4",
  "strongloop-suite_1.0.0-1_i386.deb" => "3ca5e4ba5f2d1bbe23a2b70ebdc2391012dc4e86",
  "strongloop-suite-1.0.0-1.pkg" => "b189992f20876881f0bb85e2fc80a8c4853608b5",
  "strongloop-suite-1.0.0-1-x64.msi" => "c039a819c40ebb5515d83f6f1dd7785ca55d8b99",
  "strongloop-suite-1.0.0-1-x86.msi" => "ed97db1a1f7e0c91a5157802cf98a8559a0b2872"
}

