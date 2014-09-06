User.delete_all
Property.delete_all
RentalTerm.delete_all
Roommate.delete_all
Issue.delete_all

jsvana = User.create!(
	email: 'jsvana@mtu.edu',
	password: 'linked2736',
	first_name: 'Jay',
	last_name: 'Vana'
)

rex = User.create!(
	email: 'rdbaumei@mtu.edu',
	password: 'linked2736',
	first_name: 'Rex',
	last_name: 'Baumeister'
)

phil = User.create!(
	email: 'pjmiddle@mtu.edu',
	password: 'test1234',
	first_name: 'Phil',
	last_name: 'Middleton'
)

hubbell = Property.create!(
	name: 'Brogrammer Haus',
	address: '216 Hubbell St, Houghton, MI 49931',
	description: 'Dank place yo',
	user: jsvana,
	landlord_name: 'Markus Manderfield',
	landlord_email: 'mmanders@mtu.edu',
	landlord_phone: '555.555.5555',
	rent: 350.0
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
	user: rex,
	property: hubbell,
	start_date: Date.current - 1.year,
	end_date: Date.current,
	comments: "It's alright.",
	property_rating: 3,
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
