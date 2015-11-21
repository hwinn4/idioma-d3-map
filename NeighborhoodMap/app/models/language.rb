# == Schema Information
#
# Table name: languages
#
#  id           :integer          not null, primary key
#  name         :string
#  num_speakers :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Language < ActiveRecord::Base
  has_many :state_languages
  has_many :states, through: :state_languages

  def initialize(name)
    @name = name
  end
end
