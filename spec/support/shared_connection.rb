# Use a shared connection across threads, allowing the use of capybara
# with a javascript driver without database_cleaner.
#
# Adapted from:
# http://blog.plataformatec.com.br/2011/12/three-tips-to-improve-the-performance-of-your-test-suite/
#
module ActiveRecord

  class Base

    mattr_accessor :shared_connection
    @@shared_connection = nil

    def self.connection
      @@shared_connection || retrieve_connection
    end

  end

end

ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
