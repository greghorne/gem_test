require "gem1"
# require "json"

db_hash = { :host => "zotac1.ddns.net",
            :dbname => "gisdb",
            :user => "gisdb",
            :password => "gisDB",
            :port => 2346,
            :sslmode => "require"
}

response = PGPack::PGConnect.connect(db_hash)

puts
puts "-----"
puts response
test = JSON.parse(response)
puts test["success"]
puts test["message"]
puts test["conn"]
puts "-----"
puts