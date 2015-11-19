class CreateNeighborhods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|

      t.timestamps null: false
    end
  end
end
