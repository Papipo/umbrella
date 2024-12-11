class Umbrella
  def initialize(payload)
    @payload = payload
  end

  def accounts_with_reactivations
    with("reactivation").map { |entry| entry["account"]}.uniq
  end

  private

  def with(event)
    @payload.select { |entry| entry["event"] == event }
  end
end
