require 'rails_helper'

describe ShopifyRequest do

  let(:requester) { described_class.new }
  let(:product_id) { 12464623115 }
  let(:metafield_id) { 1095403569163 }

  describe "#get_shop_information" do
    it "gets shop information", vcr: true do
      response = requester.get_shop_information
      expect(response.name).to eq "banginmeals"
    end
  end

  describe "#get_products" do
    it "gets all product information" do
      VCR.use_cassette('get_products_information') do
        response = requester.get_products(limit: 3)
        expect(response.count).to eq 3
      end
    end
  end

  describe "#get_product" do
    it "gets all product information" do
      VCR.use_cassette('get_product_information') do
        response = requester.get_product(product_id)
        expect(response.id).to eq product_id
      end
    end
  end

  describe "#get_orders" do
    it "gets all order information" do
      VCR.use_cassette('get_orders_information') do
        response = requester.get_orders(2, "created_at DESC", DateTime.new(2018,1,2,3,4,5), DateTime.new(2018,2,2,3,4,5))
        expect(response.count).to eq 2
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

  describe "create_metafield" do
    it "creates a meta field", vcr: true do
      response = requester.create_metafield("banginmeals", "carbs", 255, "integer")
      response.save!
      expect(response.value).to eq 255
    end
  end

  describe "add_metafield" do
    it "adds a meta field to a resource", vcr: true do
      product   = requester.get_product(product_id)
      metafield = requester.create_metafield("banginmeals", "carbs", 256, "integer")
      response  = requester.add_metafield(product, metafield)
      expect(response.value).to eq 256
    end
  end
end
