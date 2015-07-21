RSpec.describe OmniAuth::Strategies::NaverLogin do
  subject do
    OmniAuth::Strategies::NaverLogin.new({})
  end

  it "has correct name" do
    expect(subject.options.name).to eq("naverlogin")
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

  describe "info" do
    context "with male" do
      before(:example) do
        @gender = "M"
        allow(subject).to receive(:raw_info).and_return(raw_info_hash)
      end

      it "returns the name" do
        expect(subject.info[:name]).to eq(raw_info_hash["name"])
      end

      it "returns the email" do
        expect(subject.info[:email]).to eq(raw_info_hash["email"])
      end
      
      it "returns the nickname" do
        expect(subject.info[:nickname]).to eq(raw_info_hash["nickname"])
      end

      it "returns the image" do
        expect(subject.info[:image]).to eq(raw_info_hash["profile_image"])
      end

      it "returns the age" do
        expect(subject.info[:age]).to eq(raw_info_hash["age"])
      end

      it "returns the birthday" do
        expect(subject.info[:birthday]).to eq(raw_info_hash["birthday"])
      end
    
      it "returns male gender" do
        expect(subject.info[:gender]).to eq("male")
      end
    end

    context "with female" do     
      before(:example) do
        @gender = "F"
        allow(subject).to receive(:raw_info).and_return(raw_info_hash)
      end

      it "returns female gender" do        
        expect(subject.info[:gender]).to eq("female")
      end
    end

    context "with uncertain gender" do
      before(:example) do
        @gender = nil
        allow(subject).to receive(:raw_info).and_return(raw_info_hash)
      end

      it "returns nil gender" do
        expect(subject.info[:gender]).to eq(nil)
      end
    end
  end
end

private

  def raw_info_hash
    {
      "gender" => @gender,
      "enc_id" => "AkKauiSQz",
      "nickname" => "naverIDLogin",
      "id" => "UNIQUEID",      
      "age" => "40-49",
      "birthday" => "01-01",
      "profile_image" => "http://naver.com/image.url.jpg",
      "name" => "username"
    }  
  end