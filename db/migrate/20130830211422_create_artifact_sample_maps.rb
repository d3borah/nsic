class CreateArtifactSampleMaps < ActiveRecord::Migration
  def change
    create_table :artifact_sample_maps do |t|

      t.timestamps
    end
  end
end
