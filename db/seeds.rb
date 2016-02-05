
# Used to return a random record for testing finding unique records
def get_random_record(klass)
  klass.limit(1)
       .order( "RANDOM()" )
       .first
end

User.create!(
  email: 'user@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  company_name: 'Company',
  country_id: 1,
  firstname: 'admin',
  international: false,
  invitation_id: 1,
  lastname: 'user',
  name: 'admin user',
  title: 'jr',
  roles_mask: 2
)

50.times do |n|
  Company.create!(
    address: Faker::Address.street_address,
    city_id: n,
    country_id: n,
    coupon_id: n,
    default_labor_tax: Faker::Number.decimal(2),
    default_tax: Faker::Number.decimal(2),
    defaultavatar_id: n,
    distributor_id: n,
    engineering_labor_cost: n,
    engineering_labor_price: Faker::Number.decimal(2),
    install_labor_cost: Faker::Number.decimal(3),
    install_labor_price: Faker::Number.decimal(3),
    int_address: Faker::Address.street_address,
    int_city: Faker::Address.city,
    int_state: Faker::Address.state,
    int_zipcode: Faker::Address.zip_code,
    intcurrency_id: n,
    name: Faker::Company.name,
    phone: Faker::PhoneNumber.cell_phone,
    po_custom_id: n,
    po_custom_prefix: n,
    programming_labor_cost: Faker::Number.decimal(3),
    programming_labor_price: Faker::Number.decimal(3),
    project_custom_id: n,
    project_custom_prefix: Faker::Company.suffix,
    project_terms: Faker::Hipster.paragraph,
    ship_address: Faker::Address.street_address,
    ship_city_id: n,
    ship_city_name: Faker::Address.city,
    ship_city_state: Faker::Address.state,
    ship_city_zip: Faker::Address.zip_code,
    ship_taxes: true,
    stripe_customer_token: n,
    supervision_labor_cost: Faker::Number.decimal(3),
    supervision_labor_price: Faker::Number.decimal(3),
    tax_labor: false,
    trial_days: n,
    url: Faker::Internet.url,
  )
  
  random_company = get_random_record(Company)
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  name = "#{firstname} #{lastname}"
  
  user = User.new(
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    company_name: random_company.name,
    country_id: 1,
    firstname: firstname,
    international: false,
    invitation_id: n,
    lastname: lastname,
    name: name,
    title: 'Jr.',
    roles_mask: 2
  )
  
  user.company_ids = random_company.id
  user.save!

  Campaign.create!(
    company_id: random_company.id,
    name: random_company.name,
    channel: 'phone',
    campaign_type: 'Scrape', # Unsure of what the other options are
    campaign_date: Faker::Date.between(20.days.ago, Date.today),
    file_url: Faker::Internet.url
  )
end

