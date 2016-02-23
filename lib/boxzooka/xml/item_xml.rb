module Boxzooka
  module Xml
    class ItemXml
      attr_reader :xml

      def initialize(item)
        @item = item
        @xml = build_xml
      end

      private

      def build_xml
        builder = Builder::XmlMarkup.new

        builder.Item do
          builder.BrandOrManufacturer item.brand_or_manufacturer
          builder.CurrencyCode item.currency_code
          builder.Category item.category
          builder.Color item.color
          builder.CountryOfOrigin item.country_of_origin
          builder.DeclaredCustomsValue item.declared_customs_value
          builder.Description item.description
          builder.DimHeight item.dim_height
          builder.DimLength item.dim_length
          builder.DimUnit item.dim_unit
          builder.DimWidth item.dim_width
          builder.ImageUrl item.image_url
          builder.ItemName item.item_name
          builder.ItemUrl item.item_url
          builder.Materials item.materials
          builder.ShortDescription item.short_description
          builder.Size item.size
          builder.Sku item.sku
          builder.UCC item.ucc
          builder.UpcVendorBarcode item.upc_vendor_barcode
          builder.Weight item.weight
          builder.WeightUnit item.weight_unit
        end
      end

      attr_reader :item, :builder
    end
  end
end
