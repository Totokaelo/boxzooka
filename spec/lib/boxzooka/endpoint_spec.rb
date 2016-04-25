require 'spec_helper'

describe Boxzooka::Endpoint do
  let(:endpoint) { boxzooka_endpoint }
  let(:response)  { endpoint.execute(request) }
end
