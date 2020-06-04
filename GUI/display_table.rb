# frozen_string_literal: true

# File created 06/04/2020 by Yifan Yao
# ATTEN: PART OF CODES IN THIS FILE WERE REFERENCED FROM FXRuby - Create Lean and Mean GUIs with Ruby (2008)
#   URL: http://index-of.es/Ruby/FXRuby%20-%20Create%20Lean%20and%20Mean%20GUIs%20with%20Ruby%20(2008).pdf
require 'fox16'

include Fox

require './GUI/table'
require './GUI/table_layout'
require './GUI/card'

# Class created 06/04/2020 by Yifan Yao
class DisplayTable < FXMainWindow
  def initialize(app)
    super(app, 'The Game of Set', width: 640, height: 325)
    @table = Table.new
    (0..11).each { |i| @table.add_card(Card.new("./resource/#{i}.png"))}
    @table_view = TableLayout.new(self, @table)
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end
end

if __FILE__ == $PROGRAM_NAME
  FXApp.new do |app|
    DisplayTable.new(app)
    app.create
    app.run
  end
end
