class AnalysesController < ApplicationController
  def index 
   @analysis = Analysis.new
  end

  def create
   @analysis = Analysis.new(post_params)
  end
  
  private

  def post_params
    params.require(:analysis).permit(:document)
  end
end
