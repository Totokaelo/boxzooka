# Define some useful global functions.
module BoxzookaSpecHelper
  def boxzooka_customer_id
    ENV['BOXZOOKA_CUSTOMER_ID']
  end

  def boxzooka_customer_key
    ENV['BOXZOOKA_CUSTOMER_KEY']
  end

  def boxzooka_hostname
    'sandbox3.boxzooka.com'
  end

  def boxzooka_endpoint
    Boxzooka::Endpoint.new(
      customer_id: boxzooka_customer_id,
      customer_key: boxzooka_customer_key,
      hostname: boxzooka_hostname,
      debug: true
    )
  end
end
