module CampaignsHelper
  
  # Returns the available sales channels for campaigns
  def get_channels
    [
      [ 'Yahoo' ],
      [ 'LinkedIn' ],
      [ 'Facebook' ],
      [ 'Google' ],
      [ 'Other' ]
    ]
  end
  
  # Returns the available campaign types
  def get_campaign_types
    [
      [ 'Scrape' ],
      [ 'List' ],
      [ 'Ads' ],
      [ 'Other' ]
    ]
  end
  
  # Returns the customer types
  def get_customer_types
    [
      [ 'Integrator' ],
      [ 'Distributor ' ],
      [ 'Enterprise' ],
      [ 'Sales Rep' ],
      [ 'Manufacturer' ]
    ]
  end
end
