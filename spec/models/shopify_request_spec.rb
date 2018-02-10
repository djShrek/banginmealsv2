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

  describe "#get_products" do
    it "gets all product information", vcr: :record_once do
      VCR.use_cassette('get_products_information') do
        response = requester.get_products
        expect(response.count).to eq 50
      end
    end
  end

  describe "#get_product" do
    it "gets all product information", vcr: :record_once do
      VCR.use_cassette('get_product_information') do
        id = 12464623115
        response = requester.get_product(id)
        expect(response.id).to eq id
      end
    end
  end

  describe "#get_orders" do
    it "gets all order information" do
      VCR.use_cassette('get_orders_information') do
        response = requester.get_orders
        expect(response.count).to eq 50
      end
    end
  end

  describe "#get_order" do
    it "gets all orders information" do
      VCR.use_cassette('get_order_information') do
        id = 159555551243
        response = requester.get_order(id)
        expect(response.id).to eq id
      end
    end
  end
end
