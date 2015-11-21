class RemoveNumFromStates < ActiveRecord::Migration
  def change
    remove_column(:states, :num)
  end
end
