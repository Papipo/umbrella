require "minitest/autorun"
require "json"
require_relative "umbrella"

class TestUmbrella < Minitest::Test
  def setup
    json = File.read("input.json")
    payload = JSON.parse(json)
    @umbrella = Umbrella.new(payload)
  end

  def test_with_reactivations
    assert_equal ["B0001", "C001"], @umbrella.accounts_with_reactivations
  end

  def test_multiple_cancellations
    assert_equal ["B0001"], @umbrella.accounts_with_multiple_cancellations
  end
end
