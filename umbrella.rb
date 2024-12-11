class Umbrella
  def initialize(payload)
    @payload = payload
  end

  def accounts_with_reactivations
    accounts_with("reactivation").uniq
  end

  def accounts_with_multiple_cancellations
    accounts_with("cancellation").tally.reject { |account, count| count < 2 }.keys
  end

  private

  def accounts_with(event)
    @payload.filter_map { |entry| entry["account"] if entry["event"] == event }
  end
end
