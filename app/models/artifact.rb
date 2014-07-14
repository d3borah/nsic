class Artifact < ActiveRecord::Base
  #attr_accessible :list, :show
  set_table_name("artifact")

  belongs_to :process
end
