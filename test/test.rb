require "gem1"
require "pg"

repeat = 20
sum = 0

def test_gem(db_hash, repeat)
    sum = 0
    repeat.times {

        db_hash = { :host => ENV["PG_HOST"],
                    :dbname => ENV["PG_DB"],
                    :user => ENV["PG_USER"],
                    :password => ENV["PG_PASSWORD"],
                    :port => ENV["PG_PORT"],
                    :hostaddr => ENV["PG_HOSTADDR"],
                    :sslmode => ENV["PG_SSLMODE"]
        }

        start = Time.now

        response = PGPack::PGConnect.connect(db_hash)

        conn = response[:conn]
        response_query = conn.query("select count(*) from world")

        PGPack::PGConnect.disconnect(conn)

        sum += (Time.now - start)
    }

    puts sum / repeat 
end

test_gem({  :host => ENV["PG_HOST"],
            :dbname => ENV["PG_DB"],
            :user => ENV["PG_USER"],
            :password => ENV["PG_PASSWORD"],
            :port => ENV["PG_PORT"],
            :hostaddr => ENV["PG_HOSTADDR"],
            :sslmode => ENV["PG_SSLMODE"]
        }, 20
)



