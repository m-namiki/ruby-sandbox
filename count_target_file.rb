#! ruby -Ks

=begin
    指定されたフォルダのサブフォルダにあるファイル数をカウントします。
=end

TARGET_DIR = "C:/temp/photo_20140909"

dir_count = 0
file_count = 0

dir_count = Dir.glob(TARGET_DIR + '/*').count

Dir.glob(TARGET_DIR + '/*').each do |dir|
    file_count = file_count + Dir.glob(dir + '/*').count
end

p "dir count : " + dir_count.to_s
p "file count : " + file_count.to_s