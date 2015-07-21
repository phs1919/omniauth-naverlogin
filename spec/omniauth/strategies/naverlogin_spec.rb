RSpec.describe OmniAuth::Strategies::NaverLogin do
  subject do
    OmniAuth::Strategies::NaverLogin.new({})
  end

  describe "client options" do    
    it "has correct site option" do
      expect(subject.options.client_options.site).to eq("https://nid.naver.com")
    end
    
    it "has correct authorize_url" do
      expect(subject.options.client_options.authorize_url).to eq("https://nid.naver.com/oauth2.0/authorize")
    end
    
    it "has correct token_url" do
      expect(subject.options.client_options.token_url).to eq("https://nid.naver.com/oauth2.0/token")
    end
  end
end