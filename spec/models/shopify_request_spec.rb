require 'rails_helper'

describe ShopifyRequest do
  let(:requester) { described_class.new }
  describe "#get_shop_information" do
    it "gets shop information", vcr: :record_once do
      response = request.get_shop_information.first
      expect(response.dig("name")).to eq "bangingmealz"
    end
  end
end
