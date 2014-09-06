jsvana = User.create(
	email: 'jsvana@mtu.edu',
	encrypted_password: '$2a$10$9tiujgmyWEBlDJddheGXI.4ZviLNz2AY2ZdjOUtaS9g5ZNV5P1JK6'
)

Property.create(
	address: '216 Hubbell St, Houghton, MI 49931',
	description: 'Dank place yo',
	user: jsvana
)
