require "gem1"
require "json"

db_hash = { :host => "zotac1.ddns.net",
            :dbname => "gisdb",
            :user => "gisdb",
            :password => "gisDBA",
            :port => 2346,
            :sslmode => "require"
}

response = PGPack::ClassMain.connect(db_hash)

puts
puts "-----"
puts response
puts "-----"
# puts response.keys
puts "====="
test = JSON.parse(response)
puts test["message"]
puts "-----"
puts