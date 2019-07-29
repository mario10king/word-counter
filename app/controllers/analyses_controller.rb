class AnalysesController < ApplicationController
  def index 
   @analysis = Analysis.new
  end

  def show
    @analysis = Analysis.find(params[:id])
  end

  def create
   @analysis = Analysis.new
   document = post_params["document"]
   word_count = @analysis.count(document)
   @analysis.words = word_count
   @analysis.document = document 

   redirect_to @analysis if @analysis.save
  end
  
  private

  def post_params
    params.require(:analysis).permit(:document)
  end
end
