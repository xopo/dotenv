syntax on
set number
set relativenumber
" disable c-s as save 
set mouse=a
set rtp+=/opt/homebrew/opt/fzf

nnoremap Q q
nnorempa q <Nop>

augroup env_filetype
  autocmd!
  autocmd BufRead,BufNewFile *.env setfiletype conf
augroup END

" background highlight
" set winhighlight=Normal:Bg,Float:Bg

" highlight Normal cterm=NONE ctermbg=DarkGrey ctermfg=White
" highlight Float cterm=NONE ctermbg=LightGrey ctermfg=Black

