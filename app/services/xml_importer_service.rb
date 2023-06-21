class XmlImporterService
  require 'nokogiri'

  def initialize(xml_file)
    @xml_file = xml_file
  end

  def execute
    parse_xml
    import_data
  end

  def errors
    @fetch_errors
  end

  private

  attr_reader :xml_file

  def parse_xml
    doc = Nokogiri::XML(open(xml_file))

    @parsed_data = {
      access_key: doc.css("chNFe").text
    }
  end

  def import_data
    Xml.transaction do
      begin
        Xml.create!(@parsed_data)
      rescue ActiveRecord::RecordInvalid => e
        @fetch_errors << e
        raise ActiveRecord::Rollback
      end
    end
  end
end
