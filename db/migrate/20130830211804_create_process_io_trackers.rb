class CreateProcessIoTrackers < ActiveRecord::Migration
  def change
    create_table :process_io_trackers do |t|

      t.timestamps
    end
  end
end
