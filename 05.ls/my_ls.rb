#!/usr/bin/env ruby
#frozen_string_literal: true

# ディレクトリが空かチェック、空なら処理を抜ける
def current_empty?
  Dir.empty?(Dir.foreach)
  return #if true
end

#昇順で取得
ary1 = Dir.glob('*').sort

#n列に
n = 3
numbers = []
ary1.each_slice(n) {|a| numbers << a}

p numbers
