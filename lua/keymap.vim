    command Q q
    command W w

    nnoremap <silent><nowait>; :
    nnoremap <silent><nowait>@ q
    nnoremap <silent><nowait>mm %
    nnoremap <silent><nowait>% ggVG$
    nnoremap <silent><nowait><leader>c gcc

    nnoremap x V
    nnoremap X V

    inoremap <silent><nowait><C-s> :write<CR>
    nnoremap <silent><nowait>S :write<CR>
    vnoremap <silent><nowait>S :write<CR>

    nnoremap <silent><nowait>- <C-x>
    nnoremap <silent><nowait>+ <C-a>
    vnoremap <silent><nowait>- <C-x>
    vnoremap <silent><nowait>+ <C-a>

    nnoremap <silent><nowait><Tab> >>
    nnoremap <silent><nowait><S-Tab> <<
    vnoremap <silent><nowait><Tab> >gv
    vnoremap <silent><nowait><S-Tab> <gv

    vnoremap <silent><nowait>x <Down> 
    vnoremap <silent><nowait>X <Up> 

    nnoremap <silent><nowait><A-j> :move .+1<CR>==
    nnoremap <silent><nowait><A-k> :move .-2<CR>==
    vnoremap <silent><nowait><A-j> :m '>+1<CR>gv=gv
    vnoremap <silent><nowait><A-k> :m '<-2<CR>gv=gv

    nnoremap <silent><nowait>d "_dl
    vnoremap <silent><nowait>d "_d
   
    vnoremap <silent><nowait>i <ESC><ESC>i
    vnoremap <silent><nowait>I <ESC><ESC>I
    vnoremap <silent><nowait>a <ESC><ESC>a
    vnoremap <silent><nowait>A <ESC><ESC>A
    vnoremap <silent><nowait>o <ESC><ESC>o
    vnoremap <silent><nowait>O <ESC><ESC>O

    au VimLeave * set guicursor=a:ver25-blinkon0
    unmap grr
    unmap gra
    unmap grn
    unmap gri

    nnoremap ge G
    nnoremap gl $
    nnoremap gh ^

    nnoremap <C-i> <C-i>
    vnoremap <C-i> <ESC><C-i>
    vnoremap <C-o> <ESC><C-o>
    nnoremap s /

    noremap P <cmd>:echo expand("%")<CR>
