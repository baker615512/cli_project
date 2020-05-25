# application environment
require 'bundler/setup'
Bundler.require(:default)

require_relative './dnd_skills_cli/api.rb'
require_relative './dnd_skills_cli/cli.rb'
require_relative './dnd_skills_cli/dnd_skills.rb'