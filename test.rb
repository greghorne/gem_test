require "gem1"

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
puts response["message"]
puts "-----"
puts