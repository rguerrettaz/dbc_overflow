class User < ActiveRecord::Base
  has_many :questions
  has_many :votes
  has_secure_password

  EMAIL_REGEX = /^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/
  before_create :generate_username
  before_create :downcase_email
  attr_accessible :email, :password, :username, :passwword_confirmation
  validates :email, :uniqueness => true, :presence => true, :format => { :with => EMAIL_REGEX
   }
  validates :username, :uniqueness => true
  validates :password, :presence => true
  private

  def downcase_email
    self.email = self.email.downcase 
  end

  def create_username
    name = self.email.split("@")[0]
    num = 1
    while User.find_by_username(name)
      name = self.email.split("@")[0] + num.to_s
      num += 1
    end 
    name
  end

  def generate_username
    
    self.username = create_username if self.username.blank?
  end

end
