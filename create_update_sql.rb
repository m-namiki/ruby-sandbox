#! ruby -Ks

=begin
    指定されたフォルダ内のフォルダ名から更新用SQLを作成してファイルに出力する。
=end

TARGET_DIR = "C:/temp/photo_20140909"

DIST_FILE = TARGET_DIR + '/' + "update.sql"

UPDATE_SQL = "UPDATE t_image SET delete_deadline = '2014-10-31 23:59:59' WHERE image_id = '"

# 既に存在する場合は一回削除
if FileTest.exist?(DIST_FILE) then
    File.delete(DIST_FILE)
end

Dir.glob(TARGET_DIR + '/*').each do |dir|

    if FileTest::directory?(dir)

        File.open(DIST_FILE, "a") { |f|
            image_id = File::basename(dir).split("_")[1]
            f.write  UPDATE_SQL + image_id + "';" + "\n"
        }

    end

end