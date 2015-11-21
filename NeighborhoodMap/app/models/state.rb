# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  num        :integer
#

class State < ActiveRecord::Base
  has_many :state_languages
  has_many :languages, through: :state_languages

  def initialize(name, num)
    @name = name
    @num = num
  end
end
