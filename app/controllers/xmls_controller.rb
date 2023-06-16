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

  def edit
  end

  def create
    @xml =
    file = xml_params[:xml_file]
    import_xml = ::XmlImporterService.new(file)
    import_xml.execute

    if import_xml.errors.any?
      flash[:notice] = "Error to process the XML file: #{import_xml.errors.join(', ')}"
      redirect_to :new
    else
      flash[:notice] = "XML file was successfully imported"
      redirect_to welcome_path
    end
  end

  def update
    respond_to do |format|
      if @xml.update(xml_params)
        format.html { redirect_to xml_url(@xml), notice: "Xml was successfully updated." }
        format.json { render :show, status: :ok, location: @xml }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @xml.errors, status: :unprocessable_entity }
      end
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
