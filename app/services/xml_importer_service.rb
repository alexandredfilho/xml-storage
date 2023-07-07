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

    issuer = doc.at('emit')
    recipient = doc.at('dest')

    @parsed_data = {
      operation_type: doc.css('natOp').text,
      key: doc.css('chNFe').text,
      issuer_name: fetch_company_name(issuer),
      issuer_cnpj: fetch_company_cnpj(issuer),
      issuer_ie: fetch_company_ie(issuer),
      recipient_name: fetch_company_name(recipient),
      recipient_cnpj: fetch_company_cnpj(recipient),
      recipient_ie: fetch_company_ie(recipient),
      invoice: doc.css('cNF').text,
      ipi: fetch_ipi(doc.at('imposto', 'IPI')),
      icms: fetch_icms(doc.at('imposto', 'ICMS', 'ICMS00'))
    }
  end

  def fetch_company_name(xml_row)
    xml_row.css('xNome').text
  end

  def fetch_company_cnpj(xml_row)
    xml_row.css('CNPJ').text
  end

  def fetch_company_ie(xml_row)
    xml_row.css('IE').text
  end

  def fetch_icms(xml_row)
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
