require "gem1"
require "pg"

def test_gem(db_hash, repeat)

    sum = 0
    repeat = 100
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
        sum += (Time.now - start)

        conn = response[:conn]
        # response_query = conn.query("select count(*) from world")

        PGPack::PGConnect.disconnect(conn)

    }

    return  (sum / repeat)
end

puts "no hostadd; no sslmode"
puts test_gem({ :host => ENV["PG_HOST"],
                :dbname => ENV["PG_DB"],
                :user => ENV["PG_USER"],
                :password => ENV["PG_PASSWORD"],
                :port => ENV["PG_PORT"]
                # :hostaddr => ENV["PG_HOSTADDR"],
                # :sslmode => ENV["PG_SSLMODE"]
        }, 20
)
puts

puts "no sslmode"
puts test_gem({ :host => ENV["PG_HOST"],
                :dbname => ENV["PG_DB"],
                :user => ENV["PG_USER"],
                :password => ENV["PG_PASSWORD"],
                :port => ENV["PG_PORT"],
                :hostaddr => ENV["PG_HOSTADDR"]
                # :sslmode => ENV["PG_SSLMODE"]
        }, 20
)
puts

puts "all values set"
puts test_gem({ :host => ENV["PG_HOST"],
                :dbname => ENV["PG_DB"],
                :user => ENV["PG_USER"],
                :password => ENV["PG_PASSWORD"],
                :port => ENV["PG_PORT"],
                :hostaddr => ENV["PG_HOSTADDR"],
                :sslmode => ENV["PG_SSLMODE"]
        }, 20
)
puts 



