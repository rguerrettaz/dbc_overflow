class Answer < ActiveRecord::Base
  attr_accessible :content

  has_many :votes, :as => :voteable
end
