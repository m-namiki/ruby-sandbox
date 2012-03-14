#! ruby -Ks
require "FileUtils"
=begin
  �w�肳�ꂽ�t�@�C���̏d���s���폜����v���O�����ł��B
=end

# �t�@�C�����i�[����f�B���N�g���ł��B
BASE_DIR = "C:/tmp/"

# �Ώۃt�@�C�����ł��B
TARGET_FILE = BASE_DIR + "path.txt"

p "***** Start *****"

new_file = BASE_DIR + "new_" + File::basename(TARGET_FILE)

# ���ɏo�͐�t�@�C��������΍폜���܂�
if FileTest.exist?(new_file) then
  File.delete(new_file)
end

# �Ώۃt�@�C���̓��e���\�[�g���܂�
line_array = File.read(TARGET_FILE).split("\n")
sorted_line = line_array.sort

# �d���s�ȊO��V�t�@�C���֏o�͂��܂�
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
