# !/usr/bin/env ruby
# frozen_string_literal: true

# ディレクトリが空かチェック、空なら処理を抜ける
def current_empty?
  Dir.empty?(Dir.foreach)
end

# 表示列数(COLUMN_COUNT)を指定
COLUMN_COUNT = 3

# 要素数が3未満の場合、不足分をnilで埋めた配列を取得
class Length
  attr_accessor :padding_files, values_files
    def initialize(padding_files, values_files)
      @padding_files = padding_files
      @values_files = values_files
    end
  end

  def fileslist
    files = Dir.glob('*').sort { |a, b| a.to_i <=> b.to_i }
    max_column = files.max { |a, b| a.length <=> b.length }
    max_length = max_column.length

    files.each do |f|
      max_length = max_column.length
      padding_files << f.ljust(max_length, ' ')
    end
  end

  def slice_list
    sliced_files = padding_files.each_slice(COLUMN_COUNT).to_a
    values_files = sliced_files.map do |a|
      a.values_at(0...COLUMN_COUNT)
    end

    values_files.transpose.each do |f|
      puts "#{f.join('       ')}\n"
    end
  end
end
fileslist