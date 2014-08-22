#! ruby -Ks

=begin
  指定されたディレクトリのサブディレクトリが空の場合は削除する。
  空でない場合はなにもしない。
=end

BASE_DIR = "C:/temp/photo"

# 対象外のディレクトリを削除します。
def delete_untarget_dirs

    Dir.glob(BASE_DIR + '/*').each do |dir|
        # ディレクトリ以外を削除
        if !FileTest::directory?(dir)
            File::delete(dir)
        end

        # 中身が空のディレクトリも削除
        if Dir.glob(dir + '/*.*').count == 0
            p "delete " + dir
            Dir::delete(dir)
        end
    end
end

# ディレクトリ名をyyyyMMddHHmmss_${imageId}にリネームします。
def rename_target_dirs

    Dir.glob(BASE_DIR + '/*').each do |dir|
        names = File::basename(dir).split("_")
        if names.length > 2
            new_dir_name = BASE_DIR + "/" + names[0] + "_" + names[2]
            File::rename(dir, new_dir_name)
        end
    end

end

# ディレクトリ内のファイルを${写真総数}_${写真番号}_${分割総数}_${送信番号}.binにリネームします。
# またディレクトリにある.jpgファイルを削除します。
def sort_target_files

    Dir.glob(BASE_DIR + '/*').each do |dir|

        dir_name = File::basename(dir)

        # 写真総数
        total_count = Dir.glob(dir + '/*.jpg').count
        # 写真番号
        photo_no = 0
        # 分割総数
        total_send_count = 0

        Dir.glob(dir + '/*.jpg').each do |f|
            photo_name = File::basename(f)
            total_send_count = Dir.glob(dir + '/' + photo_name + '_*.bin').count

            send_no = 1
            Dir.glob(dir + '/' + photo_name + '_*.bin').each do |bin|

                file_name = File::basename(bin)
                new_file_name = BASE_DIR + '/' + dir_name + '/'
                new_file_name += total_count.to_s + '_' + photo_no.to_s + '_' + total_send_count.to_s + '_' + send_no.to_s + '.bin'
                File::rename(bin, new_file_name)
                
                send_no += 1
            end

            photo_no += 1

            File::delete(f)
        end

    end


end

p "***** Start *****"

delete_untarget_dirs()
rename_target_dirs()
sort_target_files()

p "***** Finish *****"
