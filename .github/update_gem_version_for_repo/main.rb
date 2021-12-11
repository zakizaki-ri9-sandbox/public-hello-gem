require 'octokit'
puts ENV['TEST']

client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
puts client&.user
