require "gem1/version"
require "pg"

module TestUtil
  class TestClass
    
    def self.connect(db_hash)
      begin
        return PG::Connection.open(db_hash)
      rescue PG::Error => e
        return { :connection => e.connection, :result => e.result }
      end
    end

    def self.msg
      return "you said: " #+ message.to_s
    end
  end
end

