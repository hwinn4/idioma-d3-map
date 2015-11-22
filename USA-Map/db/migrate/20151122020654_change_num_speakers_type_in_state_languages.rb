class ChangeNumSpeakersTypeInStateLanguages < ActiveRecord::Migration
  def change
    change_column :state_languages, :num_speakers, :string
  end
end
