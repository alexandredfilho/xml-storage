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
      key: doc.css('chNFe').text,
      company_name: build_company_name_dest(doc.at('dest')),
      cnpj: build_cnpj_dest(doc.at('dest')),
      invoice: doc.css('cNF').text,
      ipi: fetch_ipi(doc.at('imposto', 'IPI')),
      icms: fetch_icms(doc.at('imposto', 'ICMS', 'ICMS00'))
    }
  end

  def fetch_icms(xml_row)
    binding.pry
    xml_row
    .css('vICMS')
    .text
    .to_f
  end

  def fetch_ipi(xml_row)
    xml_row
    .css('cEnq')
    .text
    .to_f
  end

  def build_company_name_dest(xml_row)
    xml_row.css('xNome').text
  end

  def build_cnpj_dest(xml_row)
    xml_row.css('CNPJ').text
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
