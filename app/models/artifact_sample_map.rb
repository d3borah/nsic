class ArtifactSampleMap < ActiveRecord::Base
  # attr_accessible :title, :body
  set_table_name("artifactsamplemap")

  belongs_to :samples
  belongs_to :processes
  
end
