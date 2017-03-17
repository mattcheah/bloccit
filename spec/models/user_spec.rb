require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }
  
  it { is_expected.to have_many(:posts) }
  it { is_expected.to have_many(:comments) }
  
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(1) }
  
  it {is_expected.to validate_presence_of(:email) }
  it {is_expected.to validate_uniqueness_of(:email) }
  it {is_expected.to validate_length_of(:email).is_at_least(3) }
  it {is_expected.to allow_value("user@bloccit.com").for(:email) }
  
  it {is_expected.to validate_presence_of(:password) }
  it {is_expected.to have_secure_password }
  it {is_expected.to validate_length_of(:password).is_at_least(6) }
  
   describe "attributes" do
      it "should have name and email attributes" do
         expect(user).to have_attributes(name: "Bloccit User", email: "user@bloccit.com")
      end
      
      it "responsds to role" do
         expect(user).to respond_to(:role)
      end
      
      it "responds to admin?" do
         expect(user).to respond_to(:admin?)
      end
      
      it "responds to member?" do
         expect(user).to respond_to(:member?)
      end
   end   
      
   
      
   describe "roles" do
      it "is member by default" do
            expect(user.role).to eql("member")
      end
            
      context "member user" do
            
         it "returns false for #admin?" do
            expect(user.admin?).to be_falsey
         end
         
         it "returns true for #member?" do
            expect(user.member?).to be_truthy
         end
      end
      
      context "admin user" do
         before do
            user.admin!
         end
         
         it "returns false for @member?" do
            expect(user.member?).to be_falsey
         end
         
         it "returns true for #admin?" do
            expect(user.admin?).to be_truthy
         end
      end
   end
   
   describe "invalid user" do
      let(:user_with_invalid_name) {User.new(name: "", email: "user@bloccit.com") }
      let(:user_with_invalid_email) {User.new(name:"Bloccit User", email: "") }
      
      it "should be an invalid user due to blank name" do
         expect(user_with_invalid_name).to_not be_valid
      end
      
      it "should be an invalid user due to blank email" do
         expect(user_with_invalid_name).not_to be_valid
      end
   end
   
   
   describe "name field" do
      let(:user) {User.create!(name: "bloccit user", email: "user@bloccit.com", password: "password") }
  
      it "capitalizes the first letter of the string" do
         expect(user.name[0] == user.name[0].upcase).to be true
      end
      
      it "capitalizes the last name in the string" do

         expect(user.name.split(" ")[1][0] == user.name.split(" ")[1][0].upcase).to be true
      end
   end   
   
end
