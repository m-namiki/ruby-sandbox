#! ruby -Ks

=begin
  �t�@�C���̒��g���\�[�g���܂��B
=end

# �t�@�C�����i�[����f�B���N�g���ł��B
BASE_DIR = "C:/tmp/"

# �Ώۃt�@�C���ł��B
TARGET_FILE = BASE_DIR + "test.txt"

line_array = File.read(TARGET_FILE).split("\n")
line_array.sort
File.delete(TARGET_FILE)

File.open(TARGET_FILE, "w") {|f|
  line_array.each {|line|
    p line
    f.write line + "\n"
  }
}



