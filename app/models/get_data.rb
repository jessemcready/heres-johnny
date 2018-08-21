require 'rest-client'
require 'json'
require 'pry'

def token
  ENV['TOKEN']
end

def channel
  ENV['CHANNEL']
end

def johnny
  ENV['USER']
end

def presence_check
  response_string = RestClient.get("https://slack.com/api/users.getPresence?token=#{token}&user=#{johnny}")
  response_hash = JSON.parse(response_string)
  if response_hash["presence"] == "active"
    true
  else
    false
  end
end

def johnny_quotes
  ["Respect the wealth", "Here's Johnny!", "Who are you talking about, that girl?", "Splat!", "Codesmith has higher starting salaries.", "Yicheng nice to meet you."]
end

def write_to_channel
  RestClient.post("https://slack.com/api/chat.postMessage",
    token: token,
    channel: channel,
    text: johnny_quotes.sample
    )
end
