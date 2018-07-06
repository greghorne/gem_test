require "gem1/version"
require "pg"
require "resolv"

module PGPack
  class PGConnect
    
    def self.connect(db_hash)

      # resolve the host ip address if necessary; :hostaddr (ip) overrides :host (name)
      db_hash[:hostaddr] || (Resolv.getaddress db_hash[:host])

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

