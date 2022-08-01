# !/usr/bin/env ruby
# frozen_string_literal: true

# 表示列数を指定
COLUMN_COUNT = 3
def files
  Dir.glob('*').sort
end

files

def file_names_with_padding
  max_column = files.max_by(&:length)
  files.map do |f|
    max_length = max_column.length
    f.ljust(max_length, ' ')
  end
end

def slice_list(padding_files)
  total_file = files.size
  rows = ((total_file / COLUMN_COUNT) + 1).ceil
  sliced_files = padding_files.each_slice(rows)
  values_files = sliced_files.map do |a|
    a.values_at(0...rows)
  end
  values_files.transpose.each do |f|
    puts "#{f.join('     ')}\n"
  end
end
padding_files = file_names_with_padding
slice_list(padding_files)
