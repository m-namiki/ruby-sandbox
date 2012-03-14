#! ruby -Ks

=begin
  週報ファイルを個人別ディレクトリに振り分けるプログラムです。
  ダウンロードディレクトリからの移動にも対応しています。
  既知のバグ：
    「神」の字がsplitした時に消失する
=end

# ダウンロードディレクトリ
DOWNLOAD_DIR = "D:/m-namiki/download/"

# 週報のディレクトリ
BASE_DIR = "D:/m-namiki/00_シャンテリー/01_管理/週報/"

# 週報ファイル名のキー
WORK_REPORT_KEY = "週報"

p "***** Start *****"

# ダウンロードディレクトリのファイルからファイル名に「週報」の文字列が
# 含まれるファイルを週報ディレクトリに移動します。
Dir.glob(DOWNLOAD_DIR + "*").each do |file|
  file_name = File::basename(file)
  if file_name.include?(WORK_REPORT_KEY) then
    File.rename(file, BASE_DIR + file_name)
  end
end

# 週報ディレクトリにあるファイルを個人別ディレクトリに移動します。
Dir.glob(BASE_DIR + "*").each do |file|
  if !FileTest.directory?(file) then
    file_name = File::basename(file)
    names = file_name.split("_")
    dir_name = BASE_DIR + names[0] + "_" + names[4].delete(".xls")
    if !FileTest.exist?(dir_name) then
      Dir::mkdir(dir_name)
      p "Created " + dir_name
    end

    File.rename(file, dir_name + "/" + file_name)
    p "Moved " + File::basename(file) + " to " + dir_name
  else
    next
  end
end

p "***** Finish *****"

