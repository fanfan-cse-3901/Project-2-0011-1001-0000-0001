# frozen_string_literal: true

# File created 06/04/2020 by Yifan Yao
# ATTEN: PART OF CODES IN THIS FILE WERE REFERENCED FROM FXRuby - Create Lean and Mean GUIs with Ruby (2008)
#   URL: http://index-of.es/Ruby/FXRuby%20-%20Create%20Lean%20and%20Mean%20GUIs%20with%20Ruby%20(2008).pdf
# Class created 06/04/2020 by Yifan Yao
class Card
  attr_reader :path

  def initialize(path)
    @path = path
  end
end
