require 'csv'

module Adapters
  class DataParser
    def self.parse
      file = File.join(Rails.root, 'app', 'adapters', 'usa_map_data.csv')
      all_csv_data = File.read(file)
      state_lang_info = CSV.parse(all_csv_data, headers: true)
      state_lang_hash = state_lang_info.map do |state|
        state.to_hash
        # puts "state #{state.inspect}"
      end
    end
  end
end