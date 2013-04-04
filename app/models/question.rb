class Question < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :user
  has_many :votes, :as => :votable

  validates :title, :presence => true, :length => { :minimum => 8 }

  # it { should_not allow_value("").for(:content) } we shouldn't resave a blank 
end
