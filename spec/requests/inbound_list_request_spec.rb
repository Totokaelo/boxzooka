require 'spec_helper'

describe Boxzooka::InboundListRequest do
  let(:response) { boxzooka_endpoint.execute(request) }
  let(:request) { Boxzooka::InboundListRequest.new }

  it { expect(response.class).to be(Boxzooka::InboundListResponse) }

  it 'XML should be populated' do
    puts response.xml
    expect(response.xml).to_not be_nil
  end

  it 'should have results' do
    expect(response.results).to_not be_nil
    expect(response.results).to_not be_empty
  end
end
