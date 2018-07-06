require "gem1/version"
require "pg"
require "json"

module PGPack
  class ClassMain
    
    def self.connect(db_hash)
      begin
        return PG::Connection.open(db_hash)
      rescue PG::Error => e
        return JSON.generate({ :message => e.message })
      end
    end

    def self.msg
      return "you said: " #+ message.to_s
    end
  end
end

