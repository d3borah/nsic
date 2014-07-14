class SampleUdfView < ActiveRecord::Base
  # attr_accessible :title, :body
 set_table_name("sample_udf_view") 
 belongs_to :sample

scope :by_progress, where('udfname = ?', "Progress")
scope :by_progress_date, where('udfname = ?', "Progress Date")

end
