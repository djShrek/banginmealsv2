require 'rails_helper'

describe ShopifyRequest do

  let(:requester) { described_class.new }

  describe "#get_shop_information" do
    it "gets shop information" do
      VCR.use_cassette('get_shop_information') do
        response = requester.get_shop_information
        expect(response.name).to eq "banginmeals"
      end
    end
  end
end
