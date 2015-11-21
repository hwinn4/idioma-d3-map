# == Schema Information
#
# Table name: state_languages
#
#  id          :integer          not null, primary key
#  language_id :string
#  state_id    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class StateLanguage < ActiveRecord::Base
  # has_many :states, through: :languages
  # has_many :languages, through: :states
  belongs_to :state
  belongs_to :language

  def initialize(state_id, language_id, num_speakers)
    @state_id = state_id
    @language_id = language_id
    @num_speakers = num_speakers
  end

end
