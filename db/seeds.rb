User.delete_all
Property.delete_all
RentalTerm.delete_all
Issue.delete_all
Utility.delete_all
Due.delete_all
Forum.delete_all
Post.delete_all
Comment.delete_all

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

RentalTerm.create!(
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
	start_date: Date.current - 1.year,
	end_date: Date.current,
	comments: "It's alright.",
	property_rating: 3,
	landlord_rating: 1
)

RentalTerm.create!(
	user: rex,
	property: hubbell,
	start_date: Date.current - 2.year,
	end_date: Date.current - 1.year,
	comments: 'Worst haus evar',
	property_rating: 3,
	landlord_rating: 3
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

dte = Utility.create(
	property: hubbell,
	provider: 'DTE',
	due_by: Date.current + 3.weeks,
	cost: 117
)

Due.create(
	user: jsvana,
	utility: dte,
	amount: dte.cost / 2
)

Due.create(
	user: rex,
	utility: dte,
	amount: dte.cost / 2
)

#############
# Forum Stuff
#############

assistance = Forum.create(
	name: 'Needing Assistance'
)

diy = Forum.create(
	name: 'DIY Help'
)

bad = Post.create(
	forum: assistance,
	user: phil,
	title: 'Roommates not working out. Help?',
	body: 'Started out the year and my roommates were great. Recently, though, they started not helping out (cleaning and other chores) and are generally being negative. What can I do?',
)

sink = Post.create(
	forum: diy,
	user: jsvana,
	title: 'Looking to fix the plumbing.',
	body: "Anyone here have experience with plumbing? Our sink has something wrong with it and I'd like to fix it (landlord is not responding)."
)

Post.create(
	forum: diy,
	user: rex,
	title: 'Just built a loft. Looking for feedback.',
	body: "I just finished building a loft. Seems pretty stable, but looking for advice on making it more stable."
)

Comment.create(
	post: bad,
	user: rex,
	content: 'Have you talked to them?'
)

Comment.create(
	post: bad,
	user: phil,
	content: "I have, but they don't seem to care."
)

Comment.create(
	post: sink,
	user: phil,
	content: "I would recommend having somebody trained fix it. I had an issue with my sink and nearly broke it when I tried to fix it."
)
