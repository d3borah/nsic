class CreateArtifactStates < ActiveRecord::Migration
  def change
    create_table :artifact_states do |t|

      t.timestamps
    end
  end
end
