require "gem1/version"
require "pg"

module PG_Utilities
  class PG_Connection
    
    def self.connect(host, dbname, username, password, port)?
      begin
        return PG::Connection.open(:host => host, :dbname => dbname, :username => username, :password => password, :port => port)
      rescue
        return PG::Error
      end
    end

    def self.msg(message)?
      return "you said: " + message.to_s
    end
  end
end

