require 'spec_helper'

describe Boxzooka::Xml::CatalogRequestXml do
  let(:item) {
    item = Boxzooka::Item.new
    item.brand_or_manufacturer = 'Dries van Noten'
    item.currency_code = 'USD'
    item.category = 'Coats and Jackets'
    item.color = 'Black'
    item.country_of_origin = 'IT'
    item.declared_customs_value = 5000.00
    item.description = 'A black jacket'
    item.dim_height = 50
    item.dim_width = 40
    item.dim_length = 5
    item.dim_unit = 'IN'
    item.item_name = 'Black Jacket'
    item.item_url = 'http://dries-van-noten.com/black-jacket'
    item.materials = 'Leather, Polyamide'
    item.short_description = 'Black leather jacket'
    item.size = 'Large'
    item.sku = 'ABC123'
    item.ucc = 333333333333
    item.upc_vendor_barcode = 222222222222
    item.weight = 3.12
    item.weight_unit = 'LBS'

    item
  }

  let(:catalog_request) {
    cr = Boxzooka::CatalogRequest.new
    cr.customer_access = Boxzooka::CustomerAccess.new(customer_id: 123, customer_key: 'abc')
    cr.items = [item]
    cr
  }

  subject { described_class.new(catalog_request).xml }

  it 'outputs' do
    require "rexml/document"

    doc = REXML::Document.new(subject)
    out = ""
    doc.write(out, 1)
    puts out
  end
end
