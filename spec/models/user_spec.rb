require 'spec_helper'

describe User do
  subject { FactoryGirl.create(:user) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:email) }
  it { should_not validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:email) }
  it { should_not allow_value("blah").for(:email) }
  it { should allow_value("a@db.com").for(:email) }
  it { should allow_value("A@dB.com").for(:email) }
  it { should have_many(:questions) }
  describe "#generate_username" do
    let!(:user_1) { FactoryGirl.create(:user)}
    let(:user_2) { FactoryGirl.create(:user, {:username => "", email: "Julian@ab32.com"})}
    it "should be unique" do
      user_2.username.should eq("Julian1") 
    end

  end
end
