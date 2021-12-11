require 'octokit'
client = Octokit::Client.new(access_token: ENV['PACKAGES_WRITE_TOKEN'])
puts client&.user
