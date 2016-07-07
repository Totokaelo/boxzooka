require 'spec_helper'

describe Boxzooka::LandedQuoteResponse do
  let(:response) { Boxzooka::Xml.deserialize(response_xml, described_class) }
  subject { response }

  its(:destination_country_code) { should eq('CN') }
  its(:destination_province) { should eq('Shanghai') }
  its(:duty_amount) { should eq(1.404) }
  its(:tax_amount) { should eq(0.85) }
  its(:landed_cost_token) { should eq('fQ4GQpP2cqII562c2da8b1e4dd53f25b33adf6025562') }

  its(:rates) { should eq([rate1, rate2]) }

  let(:rate1) do
    Boxzooka::LandedQuoteResponseRate.new(
      method_code: 'BXZ.SFC.CN',
      max_delivery_days: 14,
      rate_token: 'dCQBniH9EHgefU8nPyybnKuWvVeD',
      fees: [
        Boxzooka::LandedQuoteResponseRateFee.new(description: 'Base Rate', charge: 19.05),
        Boxzooka::LandedQuoteResponseRateFee.new(description: 'Fuel Surcharge', charge: 0.18),
      ]
    )
  end

  let(:rate2) do
    Boxzooka::LandedQuoteResponseRate.new(
      method_code: 'BXZ.HGH.CN',
      max_delivery_days: 7,
      rate_token: 'ywPYT3PUZToDFqNZAWRNg7ptQyTP',
      fees: [
        Boxzooka::LandedQuoteResponseRateFee.new(description: 'Base Rate', charge: 25.31),
        Boxzooka::LandedQuoteResponseRateFee.new(description: 'Fuel Surcharge', charge: 0.18),
      ]
    )
  end

  let(:response_xml) do
    <<HERE
<LandedCostResponse>
  <LandedCostToken>fQ4GQpP2cqII562c2da8b1e4dd53f25b33adf6025562</LandedCostToken>
  <DutyAmount>1.404</DutyAmount>
  <TaxAmount>0.85</TaxAmount>
  <DestinationCountryCode>CN</DestinationCountryCode>
  <DestinationProvince>Shanghai</DestinationProvince>
  <Rates>
    <Rate>
      <MethodCode>BXZ.SFC.CN</MethodCode>
      <MaxDeliveryDays>14</MaxDeliveryDays>
      <RateToken>dCQBniH9EHgefU8nPyybnKuWvVeD</RateToken>
      <Fee>
        <Description>Base Rate</Description>
        <Charge>19.05</Charge>
      </Fee>
      <Fee>
        <Description>Fuel Surcharge</Description>
        <Charge>0.18</Charge>
      </Fee>
    </Rate>
    <Rate>
      <MethodCode>BXZ.HGH.CN</MethodCode>
      <MaxDeliveryDays>7</MaxDeliveryDays>
      <RateToken>ywPYT3PUZToDFqNZAWRNg7ptQyTP</RateToken>
      <Fee>
        <Description>Base Rate</Description>
        <Charge>25.31</Charge>
      </Fee>
      <Fee>
        <Description>Fuel Surcharge</Description>
        <Charge>0.18</Charge>
      </Fee>
    </Rate>
  </Rates>
</LandedCostResponse>
HERE
  end
end
