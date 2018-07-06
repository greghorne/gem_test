require "gem1/version"
require "pg"
require "resolv"

module PGPack
  class PGConnect
    
    def self.connect(db_hash)

      if !db_hash[:hostaddr]
        db_hash[:hostaddr] = Resolv.getaddress db_hash[:host].to_s
      end

      begin
        conn = PG::Connection.open(db_hash)
        return JSON.generate({ :success => 1, :message => "SUCCESS: connected", :conn => conn })
      rescue PG::Error => e
        conn.close if conn
        return JSON.generate({ :success => 0, :message => e.message, :conn => nil })
      end
    end

  end
end

