require 'spec_helper'

describe Boxzooka::CatalogRequest, :requests do
  let(:response)  { boxzooka_endpoint.execute(request) }

  let(:item1) { FactoryGirl.build(:item) }
  let(:item2) { nil }

  let(:request) { Boxzooka::CatalogRequest.new(items: [item1]) }

  it { expect(response.class).to be(Boxzooka::CatalogResponse) }
  it { expect(response.xml).to_not be_nil }
  it { expect(response.http_response).to_not be_nil }
  it { expect(response.request).to_not be_nil }
end
