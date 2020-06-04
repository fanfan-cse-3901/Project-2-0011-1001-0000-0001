# frozen_string_literal: true

# File created 06/04/2020 by Yifan Yao
# ATTEN: PART OF CODES IN THIS FILE WERE REFERENCED FROM FXRuby - Create Lean and Mean GUIs with Ruby (2008)
#   URL: http://index-of.es/Ruby/FXRuby%20-%20Create%20Lean%20and%20Mean%20GUIs%20with%20Ruby%20(2008).pdf
# Class created 06/04/2020 by Yifan Yao
class CardProcess < FXImageFrame
  MAX_WIDTH = 150
  MAX_HEIGHT = 150

  def initialize(p, card_image)
    super(p, nil)
    load_image(card_image.path)
  end

  def load_image(path)
    File.open(path, 'rb') do |io|
      self.image = FXPNGImage.new(app, io.read)
      rescale
    end
  end

  def rescale
    resize_scale = image.width.to_f / image.height
    image.scale(MAX_WIDTH, MAX_HEIGHT / resize_scale, 1)
    end
end
