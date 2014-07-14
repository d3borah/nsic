class GeneusProcess < ActiveRecord::Base
  # attr_accessible :title, :body
  set_table_name("process")

  has_many :processiotrackers, :foreign_key => "processid"
  

end
