class User < External
  # attr_accessible :title, :body

attr_accessible :first_name, :last_name, :email, :username
#attr_protected :hashed_password, :salt

attr_accessor :password


def self.authenticate(username="", password="")
  user = User.find_by_username(username)
       if user && user.password_match?(password)
               return user
       else
               return false
       end
end
EMAIL_REGEX = /^[A-Z0-0._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  #"sexy" validations
validates :first_name, :presence => true, :length => { :maximum => 25 }
validates :last_name, :presence => true, :length => { :maximum => 50 }
validates :username, :length => { :within => 6..25 }, :uniqueness => true
validates :email, :presence => true, :length => { :maximum => 100 }, 
       :format => EMAIL_REGEX, :confirmation => true

#only on create, validate non-db attribute, so other attributes of this user can be changed on updates
validates_length_of :password, :within => 8..25, :on => :create


scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}

before_save :create_hashed_password
after_save :clear_password

def password_match?(password = "")
       #take the instances hashed_password and compare to db
       hashed_password == User.hash_with_salt(password, salt)
end


def self.make_salt(username="")
       Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
end

def self.hash_with_salt(password="", salt="")
       Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
end


private
def create_hashed_password
#whenever :password has a value, hashing is needed
unless password.blank?
       #always use "self" when assigning values
       self.salt = User.make_salt(username) if salt.blank?
       self.hashed_password = User.hash_with_salt(password, salt)
       #this is a before_save callback, so now the record saves
end
end

def clear_password
#for security, and b/c hashing is not needed over and over
self.password = nil
end


end
