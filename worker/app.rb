require "dotenv/load"
require "slack-ruby-client"

Slack.configure do |config|
  config.token = ENV["SLACK_API_TOKEN"]
end

SLACK = Slack::Web::Client.new
SLACK.auth_test

class Hello
  include Faktory::Job

  def perform(user, text, room)
    text = "@#{user["name"]} Hi"
    SLACK.chat_postMessage(channel: room, text: text)
  end
end
