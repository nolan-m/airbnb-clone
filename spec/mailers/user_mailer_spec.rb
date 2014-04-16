require "spec_helper"

describe UserMailer do
  describe "signup_confirmation" do
    user = User.create
    let(:mail) { UserMailer.signup_confirmation(user) }

    it "renders the headers" do
    #   mail.subject.should eq("Signup confirmation")
    #   mail.to.should eq(["to@example.org"])
    #   mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      # mail.body.encoded.should match("Hi")
    end
  end

end
