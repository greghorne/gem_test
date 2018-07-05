require "gem1"

db_hash = { :host => "zotac1.ddns.net",
            :dbname => "gisdb",
            :user => "gisdb",
            :password => "gisDB",
            :port => 2346
}

e = TestUtil::TestClass.connect(db_hash)

# puts e.connection
# puts "------"
puts e.message
