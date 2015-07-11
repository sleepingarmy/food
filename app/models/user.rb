class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def send_sms(recipient, body)
    @client = setup_twilio_client
    @client.account.messages.create(
      from: ENV['twilio_number'],
      to: recipient.phone,
      body: body
    )
  end

  private

  def setup_twilio_client
    Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']  
  end

end
