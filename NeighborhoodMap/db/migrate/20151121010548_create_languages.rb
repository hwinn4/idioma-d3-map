class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.integer :num_speakers
      t.timestamps null: false
    end
  end
end
