# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class State < ActiveRecord::Base
  has_many :state_languages
  has_many :languages, through: :state_languages


  

  def self.state_language_hash(num)
    num = num.to_i
    data = State.all.each_with_object({}) do |state, data_hash|
        language = state.languages[num].name
        data_hash[state.name] = {
          :language => language,
          :color => State.language_colors[language]
       }
    end
  end


   def self.language_colors
    {
      "Spanish" => "aqua", 
      "German" => "blueviolet", 
      "Yupik" => "coral", 
      "Navajo" =>  "darkcyan", 
      "Tagalog" => "darkolivegreen", 
      "Polish" => "darkseagreen",
      "Chinese" => "darkslategray",
      "French Creole" => "goldenrod", 
      "Korean" => "lawngreen", 
      "Japanese" => "lightsteelblue", 
      "French" => "maroon", 
      "Portuguese" => "peru", 
      "Arabic" => "silver", 
      "Hmong" => "tan", 
      "Vietnamese" => "yellowgreen", 
      "Dakota" => "hotpink"
    }
  end
 
end
