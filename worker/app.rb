require "dotenv/load"
require "slack-ruby-client"

Slack.configure do |config|
  config.token = ENV["SLACK_API_TOKEN"]
end

SLACK = Slack::Web::Client.new
SLACK.auth_test

SLACK_USERNAME = "fabot"

class Hello
  include Faktory::Job

  def perform(message)
    user = message["user"]["name"]
    channel = message["room"]
    text = "@#{user} Hi"
    SLACK.chat_postMessage(channel: channel, text: text, link_names: true, username: SLACK_USERNAME)
  end
end
