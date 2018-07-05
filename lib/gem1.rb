require "gem1/version"
require "pg"

module TestUtil
  class TestClass
    
    def self.connect(host, dbname, user, password, port)
      begin
        return PG::Connection.open(:host => host, :dbname => dbname, :user => user, :password => password, :port => port)
      rescue
        return "error"
      end
    end

    def self.msg
      return "you said: " #+ message.to_s
    end
  end
end

