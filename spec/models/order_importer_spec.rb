require 'rails_helper'

describe OrderImporter do

  let(:worker) { described_class.new }

  it "imports orders", vcr: true do
    expect { worker.import_orders(limit: 1) }.to change { Order.count }.from(0).to(1)
  end

  context "date range set" do
    it "imports orders from a certain range"
  end
end
