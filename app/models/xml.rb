class Xml < ApplicationRecord
  attr_accessor :xml_file
  belongs_to :store
end
