require "motion-hpple/version"

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'motion-hpple/*.rb')).each do |file|
    app.files.unshift(file)
  end
  app.libs << '/usr/lib/libxml2.2.dylib'
  
  hpple_vendor = File.expand_path(File.join(File.dirname(__FILE__), '../vendor/hpple'))
  app.vendor_project(hpple_vendor, :static)
end