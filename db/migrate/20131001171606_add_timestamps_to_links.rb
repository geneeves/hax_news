class AddTimestampsToLinks < ActiveRecord::Migration
  def change
    change_table :links do |t| 
      t.timestamps
    end
  end
end
