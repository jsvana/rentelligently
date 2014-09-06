User.delete_all
Property.delete_all
RentalTerm.delete_all

jsvana = User.create!(
	email: 'jsvana@mtu.edu',
	password: 'linked2736'
)

phil = User.create!(
	email: 'phil@mtu.edu',
	password: 'linked2736'
)

hubbell = Property.create!(
	address: '216 Hubbell St, Houghton, MI 49931',
	description: 'Dank place yo',
	user: jsvana
)

RentalTerm.create!(
	user: jsvana,
	property: hubbell,
	start_date: Date.current - 1.year,
	end_date: Date.current,
	comments: 'Best haus evar'
)

RentalTerm.create!(
	user: phil,
	property: hubbell,
	start_date: Date.current - 2.year,
	end_date: Date.current - 1.year,
	comments: 'Worst haus evar'
)
