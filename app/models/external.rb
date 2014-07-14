class External < ActiveRecord::Base
	self.abstract_class = true
	establish_connection :accounts
end
