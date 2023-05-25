class ListsController < ApplicationController
  before_action :set_list, only: %i[show]

  def index
    @lists = List.all
  end

  def show
    @movies = []
    Bookmark.where(['list_id = ?', @list.id]).each do |bookmark|
      @movies.push(Movie.find(bookmark.movie_id))
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
