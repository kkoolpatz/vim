 
" Autosys Jil Syntax file"
 
syntax match JILError "\v[^ ][^ ]*: "
syntax match JILkeywords "\vinsert_job:|update_job:|override_job:|delete_box:|delete_job:|metajob:|box_name:|command:|owner:|machine:|permission:|condition:|n_retrys:|date_conditions:|days_of_week:|run_calendar:|exclude_calendar:|start_times:|start_mins:|run_window:|description:|term_run_time:|box_terminator:|job_terminator:|std_in_file:|std_out_file:|std_err_file:|watch_file:|watch_file_min_size:|watch_interval:|min_run_alarm:|max_run_alarm:|alarm_if_fail:|job_load:|priority:|auto_delete:|max_exit_success:|box_success:|box_failure:|timezone:|group:|application:|profile:|job_type:"


syntax region JILComment start=/\/\*/ end=/\*\//
syntax match jilOperator "\v[&|=]"
syntax region Quotes  start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region Quotes  start=/\v'/ skip=/\v\\./ end=/\v'/
syntax region SUCCESS start=/\vs\(/ skip=/\v\\./ end=/\v\)/
syntax region NOTWITH start=/\vn\(/ skip=/\v\\./ end=/\v\)/
syntax region FAILURE start=/\v[ft]\(/ skip=/\v\\./ end=/\v\)/
syntax region VARIABL start=/\vv\(/ skip=/\v\\./ end=/\v\)/
syntax region VARIABL start=/\v\$\$\(/ skip=/\v\\./ end=/\v\)/

" Syntax Highlights for Todo Markdown
syntax region ITALICS  start=/\v\*\*/ end=/\v\*\*/
syntax region BOLDTEXT start=/\v \*/ end=/\v\* /
syntax region HEADING1 start=/\v^#/ end=/\v\n/ 
syntax region HEADING2 start=/\v^##/ end=/\v\n/
syntax region HEADING3 start=/\v^###/ end=/\v\n/
syntax region CODE    start=/\v^---/ end=/\v^---/
syntax region ITALICS start=/\v^\>/ end=/\v$/

hi ITALICS  guifg=#FF9966 gui=italic
hi BOLDTEXT guifg=#FFFF00 gui=BOLD
hi HEADING3 guifg=#FF00FF gui=BOLD
hi HEADING2 guifg=#EEEEEE gui=BOLD
hi HEADING1 guifg=#00FFFF gui=BOLD
hi CODE     guifg=#993300 gui=none





hi JILError guifg=#ff0000 gui=bold
hi JILKeywords guifg=#aaaaff gui=none ctermfg=208
hi JILComment guifg=#efefef gui=none ctermfg=040
hi SUCCESS guifg=#11ff11 gui=none ctermfg=040
hi FAILURE guifg=#ff3333 gui=none ctermfg=208
hi NOTWITH guifg=#EDEA15 gui=none ctermfg=208
hi VARIABL guifg=#46AFFf gui=none ctermfg=208
hi Folded  guifg=#efefff guibg=#101030 gui=BOLD ctermbg=4 ctermfg=248

"highlight default link jilcomments Comment
"highlight default link jildelim    Delimiter
highlight default link jilOperator Delimiter
highlight default link Quotes      String



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FOLD Logic start here
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal foldmethod=expr
setlocal foldexpr=GetFold(v:lnum)
" setlocal foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'^\\s*$'&&getline(v:lnum+2)=~'\\S'?'<1':1

function! GetFold(lnum)
    if getline(a:lnum)=~'\v^\s*$'
        if getline(a:lnum+1)=~'\v^\s*$'
            if getline(a:lnum+2)=~'\v\S'
                return '<1'
            endif
        endif
    endif
    return 1
endfunction

function! NeatFoldText()
"  let line = ' ' . substitute(getline(v:foldstart+1), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let line = getline(v:foldstart+1)
  let line = substitute(line, "[^ ]*: ", "  ", "g")
"  let line = substitute(line, "\s*job_type:.*", "", "")
  let line = substitute(line, "\/\\*", "", "")
  let line = substitute(line, "\\*\/", "", "")
  let line = substitute(line, "-*", "", "g")
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line  . repeat(' ', 59-strlen(line)) . "|" , 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()

