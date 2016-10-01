#!/usr/bin/ruby
require 'uri'
require 'net/http'
require 'json'

trackID = ARGV[0].split(":").last

uri = URI.parse("https://api.spotify.com/v1/tracks/#{trackID}")
body = http = Net::HTTP.get(uri)
response = JSON.parse(body)
biggest_art = response.fetch('album', {}).fetch('images',[]).sort {|a,b| a['height'].to_i + a['width'].to_i }.last
exit unless biggest_art

system("curl -o /tmp/album-art.png #{biggest_art['url']}")

puts biggest_art['url']

