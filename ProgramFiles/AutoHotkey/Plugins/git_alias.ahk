#Hotstring C O Kn Z
; C : �啶���������̋��
; O : �Ō�ɏI����������͂��Ȃ�
; Kn: �L�[�̓��͊Ԋu���ő��ɂ���
; Z : �������_�ŃL�[���͂̃o�b�t�@���N���A����
; R : ����L�[�����̂܂ܓ��͂���(�ʐݒ�)


; ��{
::gia::git add .
::gibr::git branch{Space}
::gic::git commit -m ""{Left}
::gico::git checkout{Space}
::gicon::git config --global{Space}
::gires::git reset --hard HEAD^
::gil::git log --oneline -5
::gim::git merge{Space}
::gips::git push origin master
; ::gipl::
::gis::git status{Space}

; ���p
:R:gishbr::git show-branch | grep '*' | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -1 | awk -F'[]~^[]' '{print $2}'
::gigr::git log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'
