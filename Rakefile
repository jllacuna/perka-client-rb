#!/usr/bin/env rake
require 'rake/testtask'

SRC_DIR = "#{File.dirname(__FILE__)}/src"
OUTPUT_DIR = "#{File.dirname(__FILE__)}/target"
FLATPACK_OUTPUT_DIR = "#{OUTPUT_DIR}/generated"
GEM_OUTPUT_DIR = "#{OUTPUT_DIR}/gem"

desc "Generates the flatpack lib"
task :gen do
  
  # TODO the fast tool should be downloaded directly as an executable jar file.
  # Once that's available, we can get rid of these mvn commands and the pom file.
  unless(File.exist?("#{OUTPUT_DIR}/dependency/flatpack-fast-2.7-SNAPSHOT.jar"))
    `mvn -f ../flatpack-java/fast/pom.xml install`
    `mvn -q compile dependency:copy-dependencies || exit 1`
    puts `java \
      -cp target/classes/:$(echo $(ls target/dependency/*.jar) |  sed 's/ /:/g') \
      com.getperka.flatpack.fast.FastTool \
        --RbDialect.gemName perka \
        --RbDialect.moduleName Perka \
        --RbDialect.modelModuleName Model \
        generate --dialect rb --out #{OUTPUT_DIR} $@`
  end
end

desc "Combines the generated flatpack code with our local code in the gem output dir"
task :combine => :gen do
  # clean up 
  `rm -rf #{GEM_OUTPUT_DIR}`
  `mkdir -p #{GEM_OUTPUT_DIR}`
  
  # combine our code in the gem output dir
  `cp -r #{SRC_DIR}/* #{GEM_OUTPUT_DIR}`
  `cp -r #{FLATPACK_OUTPUT_DIR}/* #{GEM_OUTPUT_DIR}/lib`
end

# Build and install the local core / client gems
task :build_deps do
  Dir.chdir("#{SRC_DIR}/../../flatpack-rb/core") { puts `bundle install` }
  Dir.chdir("#{SRC_DIR}/../../flatpack-rb/client") { puts `bundle install` }
end

desc "Run tests"
task :test => [:combine, :build_deps] do
  Dir.chdir(GEM_OUTPUT_DIR) { puts `bundle exec rspec spec` }
end

desc "Install Gem"
task :install => :test do
  Dir.chdir(GEM_OUTPUT_DIR) { puts `bundle install` }
end
