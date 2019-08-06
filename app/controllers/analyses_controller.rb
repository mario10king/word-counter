require_relative '../../lib/parser'

class AnalysesController < ApplicationController
  def index 
    analysis = Analysis.new
    analyses = Analysis.last(10).reverse

    render 'index', locals: {analysis: analysis, analyses: analyses} 
  end

  def show
    analysis = Analysis.find(params[:id])

    render 'show', locals: {analysis: analysis} 
  end

  def create
    word_count = Parser::parse_doc(document, stop_word)
    analysis = Analysis.new(document: document, stop_word: stop_word, words: word_count.to_json)

    redirect_to analysis if analysis.save
  end

  private

  def stop_word 
    stop_word_param == "1" ? true : false
  end

  def document 
    params.require(:analysis).require(:document)
  end

  def stop_word_param
    params.require(:analysis).require(:stop_word)
  end
end
