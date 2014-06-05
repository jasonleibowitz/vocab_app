class WordsController < ApplicationController

  def index
    @words = Word.order("list_count desc")
  end

  def show

  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.find_or_create_by(word_name: word_params[:word_name].downcase)
    @list = VocabList.find(word_params[:vocab_lists].to_i)
    if @list.words.include? @word
      flash[:notice] = "That word is already in this list."
    else
      @word.vocab_lists.push(@list)
      @word.dictionary_lookup
      @word.update_list_count
    end
    redirect_to @list
  end

  private
  def word_params
    params.require(:word).permit(:word_name, :vocab_lists)
  end

end
