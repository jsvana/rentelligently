require 'twilio-ruby'

class UtilityWorker
	def self.send_reminder
		@client = Twilio::REST::Client.new('AC0617b8fba19bbd6d8a72399dcbc3498c',
																			 'fcb120473bc35632c6c98a2c786e6f0e')

		@account = @client.accounts.get('AC0617b8fba19bbd6d8a72399dcbc3498c')
		@account.messages.create(
			from: '+12314217812',
			to: '+19894827371',
			body: 'Your utility bill is due in a week.'
		)
	end
end
