#! ruby -Ks
require "FileUtils"
=begin
  �w�肳�ꂽ�t�@�C���̏d���s���폜����v���O�����ł��B
  �Ώۃt�@�C���̓\�[�g����Ă��邱�Ƃ�O��Ƃ��܂��B
=end

# �t�@�C�����i�[����f�B���N�g���ł��B
BASE_DIR = "C:/tmp/"

TARGET_FILE = "path.txt"

p "***** Start *****"

new_file = BASE_DIR + "new_" + TARGET_FILE

# ���ɏo�͐�t�@�C��������΍폜���܂�
if FileTest.exist?(new_file) then
  File.delete(new_file)
end

# �d���s�ȊO��V�t�@�C���֏o�͂��܂�
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
