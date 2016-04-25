require 'spec_helper'

describe Boxzooka::OrdersListRequest, :requests do
  let(:response) { boxzooka_endpoint.execute(request) }
  let(:request) { Boxzooka::OrdersRequest.new }

  it { expect(response.class).to be(Boxzooka::OrdersResponse) }
end
