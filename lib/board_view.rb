# frozen_string_literal: true
require  'matrix'
require_relative './observer/observer'

class BoardView < Observer

  def update(boardModel)
    clean()
    printBoard(boardModel)
  end

  # def print
  #   # matrix.each do |row|
  #   #   puts row
  #   # end
  #   # pp matrix
  #   matrix.each do |r|
  #     puts r.each { |p| p }.join(" ")
  #   end
  # end
  
  def printBoard(boardModel)
    print "  "
    for col_number in 0..5
        print  col_number
        print "|" if col_number < 5
    end
    print "|\n"
    for row_number in 0..5
        print row_number 
        for matrix_col in 0..5
            print "|"
            print boardModel.symbolAt(row_number,matrix_col)
        end
        print "|\n"
    end
    STDOUT.flush
  end

  def clean
    # TODO
  end

  def printOptions()
    print "Elige una coordenada indicándola con el siguiente formato: <#Fila,#Columna>\n"
  end

  def congratulate()
    clean()
    print "Felicidades, Ganaste!! Haz logrado destapar todas las casillas sin haberte topado con ninguna bomba"
  end

  def gameOver()
    clean()
    print "Haz encontrado una bomba! Game Over :(\n"
  end

end
