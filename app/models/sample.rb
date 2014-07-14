class Sample < ActiveRecord::Base
  set_table_name("sample")

  belongs_to :project
  has_many :sample_udf_views, :primary_key => "sampleid", :foreign_key => "sampleid"

  def to_param
    name
  end

  default_scope order('name ASC') 
  
  

end
