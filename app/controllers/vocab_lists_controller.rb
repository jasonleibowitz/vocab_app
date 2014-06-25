class VocabListsController < ApplicationController

  def index
    @vocab_lists = VocabList.all
  end

  def show
    @vocab_list = VocabList.find(params[:id])
  end

  def new
    @vocab_list = VocabList.new
  end

  def create
    @vocab_list = VocabList.new(vocab_params)
    @vocab_list.user = current_user
    # @vocab_list.users.push(current_user)
    # @vocab_list.list_owner = current_user
    @vocab_list.save!
    redirect_to current_user
  end

  def edit
    @vocab_list = VocabList.find(params[:id])
  end

  def update
    @vocab_list = VocabList.find(params[:id])
    @vocab_list.update(vocab_params)
  end

  def destroy
    @vocab_list = VocabList.find(params[:id])
  end

  def test

  end

  def game
    @vocab_list = VocabList.find(params[:id])
  end

  private
  def vocab_params
    params.require(:vocab_list).permit(:list_name)
  end

end
