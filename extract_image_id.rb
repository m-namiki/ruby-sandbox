#! ruby -Ks

=begin
    画像IDを抽出して、ファイルに出力する。
=end

TARGET_DIR = "C:/temp/photo"

DIST_FILE = TARGET_DIR + '/' + "image_id.txt"

# 既に存在する場合は一回削除
if FileTest.exist?(DIST_FILE) then
    File.delete(DIST_FILE)
end

Dir.glob(TARGET_DIR + '/*').each do |dir|

    if FileTest::directory?(dir)

        File.open(DIST_FILE, "a") { |f|
          f.write  File::basename(dir).split("_")[1] + "\n"
        }

    end

end