User.delete_all
Property.delete_all
RentalTerm.delete_all
Roommate.delete_all
Issue.delete_all

jsvana = User.create!(
	email: 'jsvana@mtu.edu',
	password: 'linked2736'
)

rex = User.create!(
	email: 'rdbaumei@mtu.edu',
	password: 'linked2736'
)

phil = User.create!(
	email: 'phil@mtu.edu',
	password: 'linked2736'
)

hubbell = Property.create!(
	address: '216 Hubbell St, Houghton, MI 49931',
	description: 'Dank place yo',
	user: jsvana,
	landlord_name: 'Markus Manderfield',
	landlord_phone: 'mmanders@mtu.edu',
	landlord_phone: '555.555.5555'
)

first_rent = RentalTerm.create!(
	user: jsvana,
	property: hubbell,
	start_date: Date.current - 1.year,
	end_date: Date.current,
	comments: 'Best haus evar',
	property_rating: 4,
	landlord_rating: 1
)

RentalTerm.create!(
	user: phil,
	property: hubbell,
	start_date: Date.current - 2.year,
	end_date: Date.current - 1.year,
	comments: 'Worst haus evar',
	property_rating: 3,
	landlord_rating: 3
)

Roommate.create(
	user: jsvana,
	roommate: rex,
	rental_term: first_rent
)

Issue.create!(
	property: hubbell,
	description: 'Stove is broken.',
	fixed: true,
	user: jsvana
)

Issue.create!(
	property: hubbell,
	description: 'Windows are cracked.',
	fixed: false,
	user: rex
)

Issue.create!(
	property: hubbell,
	description: 'Skunk lives under the deck.',
	fixed: false,
	user: rex
)
