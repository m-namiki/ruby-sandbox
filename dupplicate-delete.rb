#! ruby -Ks
require "FileUtils"
=begin
  指定されたファイルの重複行を削除するプログラムです。
  対象ファイルはソートされていることを前提とします。
=end

# ファイルを格納するディレクトリです。
BASE_DIR = "C:/tmp/"

TARGET_FILE = "path.txt"

p "***** Start *****"

new_file = BASE_DIR + "new_" + TARGET_FILE

# 既に出力先ファイルがあれば削除します
if FileTest.exist?(new_file) then
  File.delete(new_file)
end

# 重複行以外を新ファイルへ出力します
work_line = "";
IO.foreach(BASE_DIR + TARGET_FILE) do |line|
  if line != work_line then
    File.open(new_file, "a") { |f|
      f.write line
    }
    work_line = line
  end
end

p "***** Finish *****"
