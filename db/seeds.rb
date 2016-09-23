# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
############
# Since Notes depend on having an Event id, db:seeds should be run on a new database or the event_ids need to be adjusted manually.
############

providers = Provider.create([
  {last_name: 'Pettus', first_name: 'Frank', title: 'Dr.', address1: 'Suite 1401', address2: '23 North Main St', city: 'Mobile', state: 'AL', postal_code: '36602', country: 'USA', years_of_experience: 23, category: 'Physician', specialty: 'Endocrinologist' },
  {last_name: 'Pill', first_name: 'Henry', title: 'Dr.', address1: 'Suite 708', address2: '6300 Lincoln Parkway NW', city: 'Mobile', state: 'AL', postal_code: '36602', country: 'USA', years_of_experience: 15, category: 'Physician', specialty: 'General Practioner' },
  {last_name: 'Botham', first_name: 'Mark', title: 'Mr.', address1: 'Suite 73', address2: '243 Noth Main St', city: 'Mobile', state: 'AL', postal_code: '36602', country: 'USA', years_of_experience: 7, category: 'Attorney', specialty: 'Corporate Law' },
  {last_name: 'Diggs', first_name: 'Gabrielle', title: 'Ms.', address1: '', address2: '8475 Peachtree Ave NE', city: 'Atlanta', state: 'GA', postal_code: '30321', country: 'USA', years_of_experience: 2, category: 'Physician Assistant', specialty: 'OB/GYN' },
  {last_name: 'Shyster', first_name: 'Peter', title: 'Mr.', address1: 'Suite 700', address2: '19 Barnard Place', city: 'Atlanta', state: 'GA', postal_code: '30322', country: 'USA', years_of_experience: 9, category: 'Attorney', specialty: 'Divorce' }
	])

clients = Client.create([
  {last_name: 'Harris', first_name: 'Bob', gender: 'male', date_of_birth: Date.new(1952, 8, 4), address1: 'Apt 5', address2: '197 Lakeview West', city: 'Mobile', state: 'AL', postal_code: '36619', country: 'USA' },
  {last_name: 'Sequin', first_name: 'Pete', gender: 'male', date_of_birth: Date.new(1959, 9, 11), address1: '', address2: '3212 Parkview Lane', city: 'Mobile', state: 'AL', postal_code: '36620', country: 'USA' },
  {last_name: 'Hapt', first_name: 'Molly', gender: 'female', date_of_birth: Date.new(1992, 2, 26), address1: 'Building 2, Apt 2A',  address2: '19 Commons Way', city: 'Mobile', state: 'AL', postal_code: '36608', country: 'USA' },
  {last_name: 'Pfish', first_name: 'Susan', gender: 'female', date_of_birth: Date.new(1978, 11, 16), address1: '', address2: '1 Hillside Ave', city: 'Dunwoody', state: 'GA', postal_code: '30303', country: 'USA' },
  {last_name: 'Segers', first_name: 'Jimmy', gender: 'male', date_of_birth: Date.new(1952, 4, 1), address1: '', address2: '54 Swanzey Road', city: 'Roswell', state: 'GA', postal_code: '30076', country: 'USA' },
	])
## All events written from client perspective; client 5 and provider 3 have no events.
events = Event.create([
	{client_id: 1, provider_id: 2, event_date: Date.today, description: 'Annual physical, blood tests.', amount_paid: 125.00, has_insurance: true, client_confirmed: true, provider_confirmed: true, rating: true},
  {client_id: 1, provider_id: 5, event_date: Date.today, description: 'First Interview', amount_paid: 300.00, has_insurance: nil, client_confirmed: true, provider_confirmed: false, rating: false},
  {client_id: 2, provider_id: 2, event_date: Date.today, description: 'Allergy testing.', amount_paid: 325.00, has_insurance: true, client_confirmed: true, provider_confirmed: false, rating: true},
  {client_id: 2, provider_id: 5, event_date: Date.today, description: 'Reviewed child support docs.', amount_paid: 938.50, has_insurance: nil, client_confirmed: true, provider_confirmed: false, rating: true},
	{client_id: 3, provider_id: 1, event_date: Date.yesterday, description: 'Diabetes testing.', amount_paid: 75.00, has_insurance: true, client_confirmed: true, provider_confirmed: true, rating: false},
	{client_id: 3, provider_id: 2, event_date: Date.today, description: 'Cast removed from leg.', amount_paid: 275.00, has_insurance: true, client_confirmed: false, provider_confirmed: true, rating: true},
  {client_id: 4, provider_id: 1, event_date: Date.today, description: 'Hormonal treatments.', amount_paid: 125, has_insurance: true, client_confirmed: true, provider_confirmed: true, rating: false},
  {client_id: 4, provider_id: 4, event_date: Date.yesterday, description: 'Annual exam with pap smear.', amount_paid: 175.00, has_insurance: true, client_confirmed: true, provider_confirmed: false, rating: true}
	])

notes = Note.create([
	{event_id: 2, comment: "I thought Shyster's approach was too harsh and he was motivated to create problems so he could earn more money.", author: 'Bob Harris' }, 
	{event_id: 2, comment: 'This potential client completely mis-understood his own needs in the face of an ex-spouse ready to harm him and the children.', author: 'Peter Shyster, Atty.' }, 
	{event_id: 8, comment: 'Fabulous PA, very friendly and compassionate.', author: 'Susan Phish' }
	])




