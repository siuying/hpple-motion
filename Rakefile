$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'motion-cocoapods'

Motion::Project::App.setup do |app|
  app.name = 'HppleMotion'
  app.files += Dir.glob(File.join(app.project_dir, 'lib/*.rb'))
  app.vendor_project('vendor/hpple', :static)
  app.libs << ['/usr/lib/libxml2.2.dylib']
end
