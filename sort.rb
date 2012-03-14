#! ruby -Ks

=begin
  ファイルの中身をソートします。
=end

# ファイルを格納するディレクトリです。
BASE_DIR = "C:/tmp/"

# 対象ファイルです。
TARGET_FILE = BASE_DIR + "test.txt"

line_array = File.read(TARGET_FILE).split("\n")
line_array.sort
File.delete(TARGET_FILE)

File.open(TARGET_FILE, "w") {|f|
  line_array.each {|line|
    p line
    f.write line + "\n"
  }
}



