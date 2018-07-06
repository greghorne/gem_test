require "gem1"
require "pg"
# require "json"

repeat = 20
sum = 0

repeat.times {

    db_hash = { :host => "zotac1.ddns.netX",
            :dbname => "gisdb",
            :user => "gisdb",
            :password => "gisDB",
            :port => 2346,
            # :hostaddr => "70.189.95.235",
            :sslmode => "require"
}

start = Time.now

response = PGPack::PGConnect.connect(db_hash)

# puts
# puts "-----"
# puts response
# puts response[:success]
# puts response[:message]
# puts response[:conn]
# puts "-----"

conn = response[:conn]
# puts conn.class
response_query = conn.query("select count(*) from world")
# puts response_query[0]

PGPack::PGConnect.disconnect(conn)

sum += (Time.now - start)
}
puts sum / repeat