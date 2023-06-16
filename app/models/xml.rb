class Xml < ApplicationRecord
  attr_accessor :xml_file
  belongs_to :imported_document
end
