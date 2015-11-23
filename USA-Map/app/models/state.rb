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
    # dark orange, light orange, neon green, 
    # light blue, med blue, dark blue,
    # pink-purple, purple, teal
    # green, brown, tan, 
    colors = {
      "Spanish" => "rgb(74,217,217)", 
      "German" => "rgb(4,117,111)", 
      "Yupik" => "rgb(147,255,0)", 
      "Navajo" =>  "rgb(7,219,255)", 
      "Tagalog" => "rgb(7,118,255)", 
      "Polish" => "rgb(6,16,255)",
      "Chinese" => "rgb(206,5,255)",
      "French Creole" => "rgb(127,60,153)", 
      "Korean" => "rgb(92,78,175)", 
      "Japanese" => "rgb(255,141,0)", 
      "French" => "rgb(148,9,13)", 
      "Portuguese" => "rgb(70,137,102)", 
      "Arabic" => "rgb(167,197,32)", 
      "Hmong" => "rgb(255,243,0)", 
      "Vietnamese" => "rgb(255,72,0)", 
      "Dakota" => "rgb(246,177,195)"
    }
  end
 
end
