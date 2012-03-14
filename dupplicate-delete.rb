#! ruby -Ks
require "FileUtils"
=begin
  指定されたファイルの重複行を削除するプログラムです。
=end

# ファイルを格納するディレクトリです。
BASE_DIR = "C:/tmp/"

# 対象ファイル名です。
TARGET_FILE = BASE_DIR + "path.txt"

p "***** Start *****"

new_file = BASE_DIR + "new_" + File::basename(TARGET_FILE)

# 既に出力先ファイルがあれば削除します
if FileTest.exist?(new_file) then
  File.delete(new_file)
end

# 対象ファイルの内容をソートします
line_array = File.read(TARGET_FILE).split("\n")
sorted_line = line_array.sort

# 重複行以外を新ファイルへ出力します
work_line = "";
sorted_line.each {|line|
  if line != work_line then
    File.open(new_file, "a") { |f|
      f.write line + "\n"
    }
    work_line = line
  end
}

p "***** Finish *****"
