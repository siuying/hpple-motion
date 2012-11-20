require "bundler/gem_tasks"

$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'rubygems'
require 'bundler'
Bundler.require :default
require 'motion-cocoapods'

Motion::Project::App.setup do |app|
  app.name = 'MotionHpple'
  app.deployment_target = '5.0'
  app.pods do
    pod 'hpple', '~> 0.1.0'
  end
end