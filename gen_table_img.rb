# frozen_string_literal: true

# File created 06/05/2020 by Yifan Yao
require 'rmagick'

include Magick

# Created 06/05/2020 by Yifan Yao
# Edited 06/05/2020 by Yifan Yao: Open file through `bash`, sh may not find the $PATH for `open` command
# Combine cards images together as an 4 * n image, n can be infinity
def gen_table_img(table)
  table_img = ImageList.new

  row = ImageList.new
  counter = 0
  table.each do |i|
    row.push Image.read("./resource/#{i}.png").first
    counter += 1
    # Push current row into table_img and create a new row when counter reached to 4
    if (counter % 4).zero?
      table_img.push row.append(false)
      row = ImageList.new
    end
  end

  # Write table_img into table.jpg and open it via default viewer
  table_img.append(true).write 'table.jpg'
  file_to_open = './table.jpg'
  system %(xdg-open "#{file_to_open}")
  puts 'Please resize the table if needed!'
end
