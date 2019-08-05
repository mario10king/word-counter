class AnalysesController < ApplicationController
  def index 
   @analysis = Analysis.new
   @analyses = Analysis.last(10).reverse
  end

  def show
    @analysis = Analysis.find(params[:id])
  end

  def create
   @analysis = Analysis.new
   document = post_params["document"]
   word_count = @analysis.count(document)
   if stop_words == "1"
     @analysis.stop_word = true 
     word_count = @analysis.remove_stop_words(word_count)
   end
   @analysis.words = word_count
   @analysis.document = document 

   redirect_to @analysis if @analysis.save
  end
  
  private

  def post_params
    params.require(:analysis).permit(:document)
  end

  def stop_words
    params.require(:analysis).require(:stop_words)
  end
end
