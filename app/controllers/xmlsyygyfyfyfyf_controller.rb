class XmlsController < ApplicationController
  def index
    @xml
  end

  def new
    @xml = XML.new
  end

  def create
    @xml =
    file = xml_content_params[:xml_file].tempfile
    import_xml = ::XmlImporterService.new(file.path)
    import_xml.execute

    if import_xml.errors.any?
      flash[:notice] = "Error to process the XML file: #{import_xml.errors.join(', ')}"
      redirect_to :new
    else
      flash[:notice] = "XML file was successfully imported"
      redirect_to stores_path
    end
  end

  private

  def xml_content_params
    params.require(:xml).permit(:xml_file)
  end
end
