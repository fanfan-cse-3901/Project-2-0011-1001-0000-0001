# frozen_string_literal: true

require 'RMagick'

include Magick

def generate_table_img(table)
  big_image = ImageList.new

  row = ImageList.new
  counter = 0
  table.each do |i|
    row.push(Image.read("./resource/#{i}.png").first)
    counter += 1
    if (counter % 4).zero?
      big_image.push(row.append(false))
      row = ImageList.new
    end
  end

  big_image.append(true).write('table.jpg')
  file_to_open = './table.jpg'
  system %(open "#{file_to_open}")
end
