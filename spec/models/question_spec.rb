require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) {Question.create!(title:"Why?", body: "This is my question")}

   describe "attributes" do
      it "has title and body attributes" do
         expect(question).to have_attributes(title: "Why?", body: "This is my question")
      end
   end

end
