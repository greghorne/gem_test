require "gem1"
require "pg"
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
puts response[:success]
puts response[:message]
puts response[:conn]
puts "-----"

conn = response[:conn]
puts conn.class
response_query = conn.query("select count(*) from world")
puts response_query[0]

puts PGPack::PGConnect.disconnect(conn)