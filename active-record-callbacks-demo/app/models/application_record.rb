class ApplicationRecord < ActiveRecord::Base
  logger = Logger.new(STDOUT)
  self.abstract_class = true
end
