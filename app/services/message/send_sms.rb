class Message::SendSms
  attr_reader :message, :mobile

  def initialize(message, mobile = nil)
    @message = message
    @mobile  = mobile || mobile_number
  end

  def do(options = {})
    return true unless options[:force] || Rails.env.production?
    NotificationApi.new(mobile_number: '+79109767407', body: message.body).sms
    true
  rescue Faraday::ClientError
    false
  end

  private

  def mobile_number
    response = StatisticsApi.new(user: message.target, attrs: [:mobile_number]).attributes
    response['mobile_number']
  end
end