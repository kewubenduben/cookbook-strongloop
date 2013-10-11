name             'strongloop'
maintainer       'Ker Ruben Ramos'
maintainer_email 'kramos@phewcentral.com'
license          'All rights reserved'
description      'Installs/Configures strongloop'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.3'

%w{ debian ubuntu }.each {|os| supports os}

%w{ ark }.each {|c| depends c}
