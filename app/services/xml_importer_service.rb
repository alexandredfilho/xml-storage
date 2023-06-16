class XmlImporterService
  require 'nokogiri'

  def initialize(xml_file)
    @xml_file = xml_file
  end

  def execute
    parse_xml
    import_xml
  end

  private

  attr_reader :xml_file

  def parse_xml
    doc = Nokogiri::XML(open(xml_file))

    @parsed_data = {
      access_key: doc.css("chNFe").text
    }
    binding.pry
  end

  def import_xml
    
  end
end
