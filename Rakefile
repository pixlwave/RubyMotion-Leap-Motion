# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/osx'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

# Path to LeapSDK folder
@leapsdk_path = 'vendor/LeapSDK'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'LeapMotion'
  app.libs << "#{@leapsdk_path}/lib/libc++/libLeap.dylib"
  app.vendor_project("#{@leapsdk_path}/include", :static, :cflags => '-fobjc-arc')
  app.codesign_for_release = false
end


# Add extra Leap Motion step to build tasks
namespace :build do
  desc "Copy libLeap"
  task :development => :leapsdk do
    # copy libLeap into bundle executable directory
    cp "#{@leapsdk_path}/lib/libc++/libLeap.dylib", File.dirname(App.config.app_bundle_executable('MacOSX'))
  end

  desc "Copy libLeap"
  task :release => :leapsdk do
    # copy libLeap into bundle executable directory
    cp "#{@leapsdk_path}/lib/libc++/libLeap.dylib", File.dirname(App.config.app_bundle_executable('MacOSX'))
  end

  desc "Create LeapVector.h for RubyMotion"
  task :leapsdk do
    unless File.exists?("#{@leapsdk_path}/include/LeapVector.h")
      # read in LeapObjectiveC.h
      headerFile = File.new("#{@leapsdk_path}/include/LeapObjectiveC.h", "r")
      header = headerFile.read
      headerFile.close

      # extract LeapVector definition from header
      vector = /@interface\sLeapVector[\s\S]*?@end/.match(header)

      # write LeapVector definition to LeapVector.h
      vectorFile = File.new("#{@leapsdk_path}/include/LeapVector.h", "w")
      vectorFile.write(vector)
      vectorFile.close
    end
  end
end