require 'spec_helper'

# t.string :title, :null => false
#       t.text :content
#       t.references :user
describe Question do
  it { should belong_to(:user) }
  it { should_not allow_value("").for(:title) }
  it { should allow_value("How do you add?").for(:title)}
  it { should validate_presence_of(:title) }
end
