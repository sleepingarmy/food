class User < ActiveRecord::Base
  rolify :role_cname => 'Driver'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :addresses
  has_many :baskets

  DRIVER = '1'

  def send_sms(recipient, body)
    @client = setup_twilio_client
    @client.account.messages.create(
      from: ENV['twilio_number'],
      to: recipient.phone,
      body: body
    )
  end

  def set_user_role(role)
    self.add_role :driver if role == DRIVER
  end

  private

  def setup_twilio_client
    Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']  
  end
end
