class XmlsController < ApplicationController
  before_action :set_xml, only: %i[ show edit update destroy ]

  def index
    @xmls = Xml.all
  end

  def show
  end

  def new
    @xml = Xml.new
  end

  def create
    @xml =
    file = xml_params[:xml_file]
    import_xml = ::XmlImporterService.new(file).execute

    if import_xml.errors.any?
      flash[:flash] = "Error to process the XML file: #{import_xml.errors.join(', ')}"
      redirect_to :new
    else
      flash[:notice] = "XML file was successfully imported"
      redirect_to root_path
    end
  end

  def destroy
    @xml.destroy

    respond_to do |format|
      format.html { redirect_to xmls_url, notice: "Xml was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_xml
      @xml = Xml.find(params[:id])
    end

    def xml_params
      params.require(:xml).permit(:xml_file)
    end
end
