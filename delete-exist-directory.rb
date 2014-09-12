#! ruby -Ks
require "FileUtils"
=begin
  指定されたファイルに画像IDが記載されている場合、ディレクトリを削除します。
=end

TARGET_DIR = "C:/temp/photo_20140909"

SRC_FILE = "C:/temp/already_registed.txt"

# 存在している画像IDの読み込み
exist_imageids = File.read(SRC_FILE).split("\n")

# 画像IDが存在したらディレクトリをリネームする
Dir.glob(TARGET_DIR + '/*').each do |dir|
    image_id = File::basename(dir).split("_")[1]

    exist_imageids.each {|line|
        if image_id == line then
            new_dir_name = '000_' + File::basename(dir)
            File::rename(dir, new_dir_name)
            break
        end
    }
end



