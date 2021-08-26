class HomesController < ApplicationController
  def top
  end

  def about
  end


  def category_search
    @book = Book.new
    @books = Book.where("category LIKE?", "%#{params[:word]}%")
  end
end
