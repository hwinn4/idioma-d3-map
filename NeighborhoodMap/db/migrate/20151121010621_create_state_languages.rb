class CreateStateLanguages < ActiveRecord::Migration
  def change
    create_table :state_languages do |t|
      t.string :language_id
      t.string :state_id
      t.timestamps null: false
    end
  end
end
