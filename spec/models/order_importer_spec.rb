require 'rails_helper'

describe OrderImporter do

  let(:worker) { described_class.new }
  let(:start_date) { DateTime.new(2018,1,2,3,4,5) }
  let(:end_date) { DateTime.new(2018,2,2,3,4,5)}

  it "imports orders", vcr: true do
    expect { worker.import_orders(limit: 3, start_date: start_date, end_date: end_date) }
      .to change { Order.count }.from(0).to(3)
  end

  it "import orders only once", vcr: true do
    VCR.use_cassette('OrderImporter/imports_orders.yml') do
      2.times do
        worker.import_orders(limit: 3, start_date: start_date, end_date: end_date)
      end
      expect(Order.count).to eq 3
    end
  end

  it "imports order items", vcr: true do
    VCR.use_cassette('OrderImporter/imports_orders.yml') do
      expect { worker.import_orders(limit: 3, start_date: start_date, end_date: end_date) }
        .to change { OrderItem.count }.from(0).to(17)
    end
  end

  it "imports order items once once", vcr: true do
    VCR.use_cassette('OrderImporter/imports_orders.yml') do
      worker.import_orders(limit: 3, start_date: start_date, end_date: end_date)
      worker.import_orders(limit: 3, start_date: start_date, end_date: end_date)
      expect(OrderItem.count).to eq 17
    end
  end

end
