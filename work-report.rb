#! ruby -Ks

=begin
  �T��t�@�C�����l�ʃf�B���N�g���ɐU�蕪����v���O�����ł��B
  �_�E�����[�h�f�B���N�g������̈ړ��ɂ��Ή����Ă��܂��B
  ���m�̃o�O�F
    �u�_�v�̎���split�������ɏ�������
=end

# �_�E�����[�h�f�B���N�g��
DOWNLOAD_DIR = "D:/m-namiki/download/"

# �T��̃f�B���N�g��
BASE_DIR = "D:/m-namiki/00_�V�����e���[/01_�Ǘ�/�T��/"

# �T��t�@�C�����̃L�[
WORK_REPORT_KEY = "�T��"

p "***** Start *****"

# �_�E�����[�h�f�B���N�g���̃t�@�C������t�@�C�����Ɂu�T��v�̕�����
# �܂܂��t�@�C�����T��f�B���N�g���Ɉړ����܂��B
Dir.glob(DOWNLOAD_DIR + "*").each do |file|
  file_name = File::basename(file)
  if file_name.include?(WORK_REPORT_KEY) then
    File.rename(file, BASE_DIR + file_name)
  end
end

# �T��f�B���N�g���ɂ���t�@�C�����l�ʃf�B���N�g���Ɉړ����܂��B
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

