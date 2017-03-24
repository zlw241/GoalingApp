require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  #let(:user) { User.new(username: "zach", password: "password") }
  it "does not save passwords to the database" do
    User.create!(username: "zach", password: "password")
    user = User.find_by_username("zach")
    expect(user.password).not_to be("password")
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_uniqueness_of(:username)}
  it { should validate_uniqueness_of(:session_token) }

  # it "should return the correct username" do
  #   expect(user.username).to eq("zach")
  # end

end
