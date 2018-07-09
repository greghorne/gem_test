require "gem1"
require "pg"

repeat = 20
sum = 0

repeat.times {

    db_hash = { :host => "zotac1.ddns.net",
                :dbname => "gisdb",
                :user => "gisdb",
                :password => "gisDB",
                :port => 2346,
                :hostaddr => "70.189.95.235",
                :sslmode => "require"
    }

    start = Time.now

    response = PGPack::PGConnect.connect(db_hash)

    conn = response[:conn]
    response_query = conn.query("select count(*) from world")

    PGPack::PGConnect.disconnect(conn)

    sum += (Time.now - start)
}

puts sum / repeat