require "gem1/version"
require "pg"
require "resolv"

module PGPack
  class PGConnect
    
    # --------------------------------------------------
    # --------------------------------------------------
    def self.connect(db_hash)

      # resolve the host ip address if necessary; :hostaddr (ip) overrides :host (name)
      begin
        db_hash[:hostaddr] || (db_hash[:hostaddr] = Resolv.getaddress db_hash[:host])
      rescue
        # catch the error but just continue
      end

      begin
        conn = PG::Connection.open(db_hash)
        return { :success => 1, :message => "SUCCESS: connected", :conn => conn }
      rescue PG::Error => e
        conn.close if conn
        return { :success => 0, :message => e.message, :conn => nil }
      end
    end
    # --------------------------------------------------


    # --------------------------------------------------
    # --------------------------------------------------
    def self.disconnect(conn)
      begin
        conn.close if conn
        return true
      rescue
        return false
      end
    end
    # --------------------------------------------------


  end
end

