require 'spec_helper'

describe Boxzooka::ProductListRequest, :requests do
  let(:request)   { Boxzooka::ProductListRequest.new_with_filters(filters: { sku: '510105' }) }
  let(:response)  { boxzooka_endpoint.execute(request) }

  it { expect(response.class).to be(Boxzooka::ProductListResponse) }

  it 'XML should be populated' do
    expect(response.xml).to_not be_nil
  end

  it 'should have results' do
    expect(response.results).to_not be_nil
    expect(response.results).to_not be_empty
  end
end
