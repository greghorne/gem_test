require "gem1"

db_hash = { :host => "zotac1.ddns.net",
            :dbname => "gisdb",
            :user => "gisdb",
            :password => "gisDBA",
            :port => 2346,
            :sslmode => "require"
}

response = TestUtil::TestClass.connect(db_hash)

puts "-----"
puts response
