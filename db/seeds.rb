roles = ['admin', 'guest']

roles.each do |role|
  Role.find_or_create_by(name: role)
end

events = [
  { name: 'IPL 2020', fee: 5000, description: 'Indian Premier League', start_date: '01/05/2020', end_date: '01/07/2020' },
  { name: 'Oscar 2020', fee: 50000, description: 'Oscar', start_date: '15/04/2020', end_date: '16/04/2020' },
  { name: 'Comedy Show', fee: 1000, description: 'Indian Premier League', start_date: '02/06/2020', end_date: '02/06/2020' },
  { name: 'ICC World Cup 2019', fee: 10000, description: 'Indian Premier League', start_date: '02/06/2019', end_date: '02/07/2019' },
  { name: 'Dance Show 2020', fee: 2000, description: 'Indian Premier League', start_date: '02/06/2020', end_date: '02/06/2020' },
  { name: 'Olympics 2020', fee: 7000, description: 'Indian Premier League', start_date: '02/06/2020', end_date: '02/06/2020' }
]

events.each do |event|
  Event.find_or_create_by(
    name:        event[:name],
    fee:         event[:fee],
    description: event[:description],
    start_date:  event[:start_date],
    end_date:    event[:end_date]
  )
end

c = Coupon.find_or_create_by(
  name: 'WonderWoman',
  description: '5% off for female',
  discount_type: 'percent',
  discount: 5,
)
c.constraints = { gender: 'female' }
c.is_active = true
c.save

