# encoding: utf-8

require 'chef/cookbook/metadata'

def cookbook_metadata
  metadata = Chef::Cookbook::Metadata.new
  metadata.from_file 'metadata.rb'
  metadata
end

def cookbook_name
  name = cookbook_metadata.name
  if name.nil? || name.empty?
    File.basename(File.dirname(__FILE__))
  else
    name
  end
end

VAGRANT = ENV['VAGRANT'] || false
COOKBOOK_NAME = ENV['COOKBOOK_NAME'] || cookbook_name
COOKBOOKS_PATH = ENV['COOKBOOKS_PATH'] || 'cookbooks'

desc 'Install cookbooks from Berksfile'
task :setup_cookbooks do
  rm_rf COOKBOOKS_PATH
  sh 'berks', 'vendor', COOKBOOKS_PATH
end

desc 'Run knife cookbook test'
task 'knife' => 'setup_cookbooks' do
  sh 'knife', 'cookbook', 'test', COOKBOOK_NAME, '--config', '.knife.rb',
     '--cookbook-path', COOKBOOKS_PATH
end

desc 'Run Foodcritic lint checks'
task 'foodcritic' do
  sh 'foodcritic', '--epic-fail', 'any',
     '-X', 'cookbooks', '.'
end

desc 'Run ChefSpec examples'
task 'chefspec' => 'setup_cookbooks' do
  sh 'rspec', '--color', '--format', 'documentation',
     File.join(COOKBOOKS_PATH, COOKBOOK_NAME, 'spec')
end

desc 'Run Rubocop'
task :rubocop do
  sh 'rubocop', '-fs'
end

desc 'Run all tests'
task 'test' => %w( knife foodcritic chefspec rubocop )

# Default, test everything
task 'default' => 'test'

# Cleanup testing cookbooks
at_exit { rm_rf COOKBOOKS_PATH }
