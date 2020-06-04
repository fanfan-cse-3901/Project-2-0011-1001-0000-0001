# frozen_string_literal: true

# File created 06/04/2020 by Yifan Yao
# ATTEN: PART OF CODES IN THIS FILE WERE REFERENCED FROM FXRuby - Create Lean and Mean GUIs with Ruby (2008)
#   URL: http://index-of.es/Ruby/FXRuby%20-%20Create%20Lean%20and%20Mean%20GUIs%20with%20Ruby%20(2008).pdf
require './GUI/card_process'

# Class created 06/04/2020 by Yifan Yao
class TableLayout < FXScrollWindow
  attr_reader :table
  def initialize(p, album)
    super(p, opts: LAYOUT_FILL)
    @table = album
    FXMatrix.new(self, opts: LAYOUT_FILL | MATRIX_BY_COLUMNS)
    @table.iterator { |card| add_card(card) }
  end

  def layout
    contentWindow.numColumns = [width / CardProcess::MAX_WIDTH, 1].max
    super
  end

  def add_card(card)
    CardProcess.new(contentWindow, card)
  end
end
