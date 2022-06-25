# !/usr/bin/env ruby
# frozen_string_literal: true

# 表示列数を指定
COLUMN_COUNT = 3

def fileslist
  files = Dir.glob('*').sort { |a, b| a <=> b }
  max_column = files.max_by(&:length)

  padding_files = []
  files.each do |f|
    max_length = max_column.length
    padding_files << f.ljust(max_length, ' ')
  end
  padding_files
end

def slice_list(padding_files)
  sliced_files = padding_files.each_slice(COLUMN_COUNT).to_a
  values_files = sliced_files.map do |a|
    a.values_at(0...COLUMN_COUNT)
  end

  values_files.transpose.each do |f|
    puts "#{f.join('     ')}\n"
  end
end
padding_files = fileslist
slice_list(padding_files)
