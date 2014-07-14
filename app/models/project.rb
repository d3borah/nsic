class Project < ActiveRecord::Base
  # attr_accessible :title, :body
    set_table_name("project")

    has_many :ent, :foreign_key => "attachtoid"
    has_many :samples, :foreign_key => "projectid"

    #scope :projecttype, joins(:ent).where("projectid" = ? & 'text1 = ?', nil)

    scope :sorted, order('project.projectid DESC')
    scope :sortedudf, order('project.ent.udtid DESC')
   
    #scope :bysamplename, :include => :samples, :order => "samples.name ASC" 
    #scope :pt, joins(:ent).where('ent.rowindex != ?', 0)

    scope :by_udtids, Project.joins("left join ent on projects.projectid = ent.attachtoid").where('ent.rowindex != ?', 0).order("ent.udtid DESC")

    #SELECT "project".* FROM "project" INNER JOIN "entityudfstorage" ON "entityudfstorage"."attachtoid" = "project"."projectid" WHERE (ent.rowindex != 0)
    #PG::UndefinedTable: ERROR:  missing FROM-clause entry for table "ent"
    #LINE 1: ...rage"."attachtoid" = "project"."projectid" WHERE (ent.rowind...

    #scope :sort_by_sample_count_asc, joins(:samples).order('clients.name ASC')

    #scope :sortedudf, :include => :entityudfstorage, :order => "entityudfstorage.udtid ASC"
    
    #scope :sortedudf, joins(:entityudfstorage).order('entityudfstorage.udtid ASC')

    #scope :project_udfs, joins("join entityudfstorage on entityudfstorage.attachtoid = projects.projectid")

    #scope :sortedbymaxsamples, :conditions => order('BY CAST(maximumsampleid AS int)')

    #def numbersamplesint
	#	maximumsampleid = maximumsampleid.to_i
	#end

    #	def self.sortedbyint
    #		projects = self.all
	#		projects.sort_by(numbersamplesint)
	#end


end
