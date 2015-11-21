# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require_relative '../app/models/adapters/data_parser.rb'

Adapters::DataParser.parse.each do |state_hash|
  new_state = State.create(name: state_hash["state"])
  first_language = Language.find_or_create_by(name: state_hash["language1"])
  StateLanguage.create(state_id: new_state.id, language_id: first_language.id, num_speakers: state_hash["speakers1"].to_i)
  byebug
  second_language = Language.find_or_create_by(name: state_hash["language1"])
  StateLanguage.create(state_id: new_state.id, language_id: second_language.id, num_speakers: state_hash["speakers2"].to_i)
end