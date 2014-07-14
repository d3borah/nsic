class Ent < ActiveRecord::Base
  # attr_accessible :title, :body

  set_table_name("entityudfstorage")

	#attr_accessible :attachtoid

  belongs_to :project

  scope :rowindex, where('entityudfstorage.rowindex != ? ', "0")
end
