require 'rails_helper'

RSpec.describe Tcs::Order, type: :model do
  let(:work_order) { create :work_order }
  let(:order_line) { create :tcs_order_line }
  let(:order) { create :tcs_order, order_lines:  order_line}
  describe '#status' do
    context "arrived" do

    end
  end
end
