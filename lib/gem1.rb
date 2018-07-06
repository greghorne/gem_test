require "gem1/version"
require "pg"
require "json"

module PGPack
  class ClassMain
    
    def self.connect(db_hash)
      begin
        return PG::Connection.open(db_hash)
      rescue PG::Error => e

        return_hash = { :message => e.message}
        # puts return_hash
        # puts e.message
        return return_hash

      end
    end

    def self.msg
      return "you said: " #+ message.to_s
    end
  end
end

