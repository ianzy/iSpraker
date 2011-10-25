require 'digest'
class ApiKey < ActiveRecord::Base
  before_create :generate_key
  
  class << self
    def find_by_key(string)
      self.first(:conditions => {:key => string})
    end
  end
  
  private
    def generate_key
      # refactor the future_application_id thing in the future
      self.key = Digest::MD5.hexdigest("future_application_id--#{Time.now}")
    end
end
