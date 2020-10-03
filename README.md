# thai_post_tracking Ruby gems

Simple implementation of Postal services API in Thailand.
Don't have a proper test/spec at the moment, use at your own risk.

## Configure

```ruby
ThaiPostTracking.configure do |config|
  config.thailand_post_token = 'TOKEN_FROM_THAILANDPOST_SERVICE'
  # https://track.thailandpost.co.th
end
```
