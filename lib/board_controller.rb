# frozen_string_literal: true
require 'matrix'

class BoardController
  def initialize(boardModel, boardView)
    @model = boardModel
    @view = boardView
  end

  def printBoard
    @view.clean()
    @view.printBoard(@model)
  end

  def requestInput
    @view.printOptions()
    row, col = $stdin.gets.split(",")
    select(row,col);
  end

  def select(xo,yo)
    @model.mark(xo,yo)
    if @model.winner() then
      @view.congratulate()
    elsif @model.bomb_explosion()
        @view.gameOver()
    else
        requestInput()
    end
    @view.clean()
  end

  
end
