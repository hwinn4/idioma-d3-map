# == Schema Information
#
# Table name: state_languages
#
#  id           :integer          not null, primary key
#  language_id  :string
#  state_id     :string
#  num_speakers :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class StateLanguageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
