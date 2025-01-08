" vim: et

scriptencoding utf-8

command! ShowChanges call repo#diff_show()
command! HideChanges call repo#diff_hide()
