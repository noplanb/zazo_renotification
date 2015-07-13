module Condition::Api
  def check(user, &block)
    block_given? ? handle(&block) : false
  end

  private

  def handle
    begin
      yield
    rescue Faraday::ClientError
      false
    end
  end
end
