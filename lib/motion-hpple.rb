require "motion-hpple/version"

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'motion-hpple/*.rb')).each do |file|
    app.files.unshift(file)
  end
  app.pods ||= Motion::Project::CocoaPods.new(app)
  app.pods.pod 'hpple', '~> 0.1.0'
end