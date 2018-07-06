require "gem1/version"
require "pg"
# require "json"

module PGPack
  class PGConnect
    
    def self.connect(db_hash)
      begin
        return JSON.generate({ :success => 1, :message => "SUCCESS: connected", :conn => PG::Connection.open(db_hash) })
      rescue PG::Error => e
        return JSON.generate({ :success => 0, :message => e.message, :conn => nil })
      end
    end

  end
end

