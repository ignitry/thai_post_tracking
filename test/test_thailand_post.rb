require "test/unit"
require_relative "../lib/thai_post_tracking"

class TestThailandPost < Test::Unit::TestCase
  def setup
    ThaiPostTracking.configure do |config|
      config.thailand_post_token = ENV["THAILANDPOST_TOKEN"]
    end
    @trackings  = ["EG249704385TH"]
  end

  def test_get_items
    @get_items  = ThaiPostTracking::ThailandPost::GetItems.new
    items = @get_items.response(@trackings)

    assert_not_nil(items)
  end

  def test_hook_items
    @hook_items = ThaiPostTracking::ThailandPost::HookItems.new
    hooks = @hook_items.response(@trackings)

    assert_not_nil(hooks)
  end
end
