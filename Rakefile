#!/usr/bin/env rake
require 'rake/testtask'

SRC_DIR = "#{File.dirname(__FILE__)}/src"
OUTPUT_DIR = "#{File.dirname(__FILE__)}/target"
FLATPACK_OUTPUT_DIR = "#{OUTPUT_DIR}/generated"
GEM_OUTPUT_DIR = "#{OUTPUT_DIR}/gem"

FAST_VERSION = '2.8-SNAPSHOT'
FAST_JAR = "#{OUTPUT_DIR}/fast.jar"

task :clean do
  puts 'cleaning...'
  `rm -rf #{OUTPUT_DIR}`
end

desc "Generates the flatpack lib"
task :gen do
  
  # download the fast executable jar if we haven't already
  unless(File.exist?("#{FAST_JAR}"))
    puts 'fetching fast.jar...'
    
    `mvn -f ../flatpack-java/fast/pom.xml install`

    `mvn -U org.apache.maven.plugins:maven-dependency-plugin:2.4:get \
      -Drepo=https://oss.sonatype.org/content/groups/public/ \
      -Dartifact=com.getperka.flatpack:flatpack-fast:#{FAST_VERSION}:jar:shaded \
      -Ddest=#{FAST_JAR}`
  end

  puts 'running fast code generation...'
  `java -jar #{FAST_JAR} \
      --RbDialect.gemName perka \
      --RbDialect.moduleName Perka \
      --RbDialect.modelModuleName Model \
      generate --dialect rb --out #{OUTPUT_DIR} $@`
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
desc "Build dependent gems"
task :build_deps do
  puts 'building dependent gems...'
  Dir.chdir("#{SRC_DIR}/../../flatpack-rb/core") { `bundle install` }
  Dir.chdir("#{SRC_DIR}/../../flatpack-rb/client") { `bundle install` }
end

desc "Run tests"
task :test => [:combine, :build_deps] do
  puts 'running rspec tests...'
  Dir.chdir(GEM_OUTPUT_DIR) { puts `bundle exec rspec spec` }
end

desc "Install Gem"
task :install => :test do
  Dir.chdir(GEM_OUTPUT_DIR) { puts `bundle install` }
end
