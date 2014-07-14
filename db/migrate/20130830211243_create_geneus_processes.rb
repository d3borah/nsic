class CreateGeneusProcesses < ActiveRecord::Migration
  def change
    create_table :geneus_processes do |t|

      t.timestamps
    end
  end
end
