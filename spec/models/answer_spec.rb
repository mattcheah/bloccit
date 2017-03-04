require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) {Question.create!(title:"Why?", body: "This is my question")}
  let(:answer) {Answer.create!(body: "this is my body", question:question)}
  
  describe "attributes" do 
     it "has a body attribute" do
       expect(answer).to have_attributes(body: "this is my body")
      end
   end
end
