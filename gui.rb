Shoes.app(width: 800, height: 600) do
  # background "#0"
  Column = [20, 225, 425, 625]
  Row = [50, 200, 350]
  Pic_width = 154
  Pic_height = 100

  # Column 1
  @p1 = image 'resource/81.png', width: Pic_width, height: Pic_height
  @p1.move(Column[0], Row[0])
  @p2 = image 'resource/3.png', width: Pic_width, height: Pic_height
  @p2.move(Column[0], Row[1])
  @p3 = image 'resource/4.png', width: Pic_width, height: Pic_height
  @p3.move(Column[0], Row[2])
  # Column 2
  @p4 = image 'resource/10.png', width: Pic_width, height: Pic_height
  @p4.move(Column[1], Row[0])
  @p5 = image 'resource/4.png', width: Pic_width, height: Pic_height
  @p5.move(Column[1], Row[1])
  @p6 = image 'resource/9.png', width: Pic_width, height: Pic_height
  @p6.move(Column[1], Row[2])
  # Column 3
  @p7 = image 'resource/3.png', width: Pic_width, height: Pic_height
  @p7.move(Column[2], Row[0])
  @p8 = image 'resource/40.png', width: Pic_width, height: Pic_height
  @p8.move(Column[2], Row[1])
  @p9 = image 'resource/51.png', width: Pic_width, height: Pic_height
  @p9.move(Column[2], Row[2])
  # Column 4
  @p10 = image 'resource/50.png', width: Pic_width, height: Pic_height
  @p10.move(Column[3], Row[0])
  @p11 = image 'resource/80.png', width: Pic_width, height: Pic_height
  @p11.move(Column[3], Row[1])
  @p12 = image 'resource/41.png', width: Pic_width, height: Pic_height
  @p12.move(Column[3], Row[2])

  @card1 = para 'Card 1 Not Selected.'
  @card2 = para 'Card 2 Not Selected.'
  @card3 = para 'Card 3 Not Selected.'

  @p1.click do |button|
    @card1.replace "#{button.inspect} was PRESSED."
  end

  # @p.each do |n|
  #   n.click do |button|
  #     @info.replace "#{button.inspect} was PRESSED."
  #   end
  # end

  # keypress do |k|
  #    @info.replace "#{k.inspect} was PRESSED."
  # end
end