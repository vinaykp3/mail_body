require "spec_helper"

describe TestMail do
    include EmailSpec::Helpers
    include EmailSpec::Matchers
    # include ActionController::UrlWriter - old rails
    include Rails.application.routes.url_helpers

    def valid_attributes
    {
        :name => "Vinay",
        :email => "vinaykp3@gmail.com"
    }
    end
    before(:all) do
      @user_detail = User.create! valid_attributes
      post=['relyonlogo.png']
      @email = TestMail.registration_confirmation("<p>Registered Successfully</p>",post,@user_detail)
    end

    it "should be set to be delivered to the email passed in" do
      @email.should deliver_to(@user_detail.email)
    end

    it "should contain the user's message in the mail body" do
      @email.should have_body_text(/Registered Successfully/)
    end

    it "should have the correct subject" do
      @email.should have_subject(/Registered/)
    end
end
