require "motion-hpple/version"

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'hpple/*.rb')).each do |file|
    app.files.unshift(file)
  end
  app.libs << '/usr/lib/libxml2.2.dylib'
  app.vendor_project(File.join(File.dirname(__FILE__), 'vendor/hpple-motion/vendor/hpple'), :static)
end