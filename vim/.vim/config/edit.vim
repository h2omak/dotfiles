" sdothum - 2016 (c) wtfpl

" Edit
" ▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂

  " Line ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " .............................................................. Insert line

      " insert line while disabling auto-commenting
      function! s:insertWrap()
        let l:formatoptions = &formatoptions
        set formatoptions-=c
        set formatoptions-=r
        set formatoptions-=o
        normal! ^
        let l:pos = col('.')
        normal! o
        " align line indentation
        execute 'normal! a' . repeat(' ', l:pos)
        let &formatoptions = l:formatoptions
      endfunction

      " insert line wrap
      inoremap <silent><C-Return> <C-o>:call <SID>insertWrap()<CR>

      " continue inserting in new line a la textmate command-enter
      " ctrl-enter only works with gvim due to terminal limitation :-(
      " inoremap <C-CR> <C-o>o
      " similarly, open curly braces and continue inserting in indented body
      inoremap <S-CR> <CR><C-o>O<Tab>

      " break line (in .wiki)
      nnoremap <silent><leader><S-CR> :silent set paste<CR>i<CR><ESC>:silent set nopaste<CR>i

      " duplicate line
      nnoremap <C-CR> :t.<CR>
      inoremap <C-CR> <C-o>:t.<CR>

      " insert blank line above/below
      nnoremap <silent><leader><Up>   :silent set paste<CR>m`O<Esc>``:silent set nopaste<CR>
      nnoremap <silent><leader><Down> :silent set paste<CR>m`o<Esc>``:silent set nopaste<CR>

    " .............................................................. Delete line

      " delete blank line above/below
      nnoremap <silent><C-S-Up>   m`:silent -g/\m^\s*$/d<CR>``:silent nohlsearch<CR>
      nnoremap <silent><C-S-Down> m`:silent +g/\m^\s*$/d<CR>``:silent nohlsearch<CR>

  " Text shift ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " .............................................................. Select text

      function! s:paragraphAbove()
        if matchstr(getline(line('.')), '\S') == ''
          normal! {
          if matchstr(getline(line('.')), '\S') == '' | normal! j | endif
        endif
        normal! }lV{
      endfunction

      function! s:paragraphBelow()
        if matchstr(getline(line('.')), '\S') == ''
          normal! }
          if matchstr(getline(line('.')), '\S') == '' | normal! k | endif
        endif
        normal! {nV}
      endfunction

      " select all
      nnoremap <C-a>                ggVG
      " extend paragraph selection
      vmap     <A-PageUp>           {
      vmap     <A-PageDown>         }
      " select paragragh
      nmap     <silent><A-PageUp>   :call <SID>paragraphAbove()<CR>
      nmap     <silent><A-PageDown> :call <SID>paragraphBelow()<CR>

    " ......................................................... Shift left right

      " softwidth shifts, preserve selection when indenting
      nnoremap <S-Left>  <<
      inoremap <S-Left>  <C-d>
      vnoremap <S-Left>  <gv
      nnoremap <S-Right> >>
      inoremap <S-Right> <C-t>
      vnoremap <S-Right> >gv

      " byte shift left / right
      nnoremap <leader><Left>  :s/^ //<CR>:silent nohlsearch<CR>
      nnoremap <leader><Right> :s/^/ /<CR>:silent nohlsearch<CR>
      vnoremap <leader><Left>  :s/^ //<CR>:silent nohlsearch<CR>gv
      vnoremap <leader><Right> :s/^/ /<CR>:silent nohlsearch<CR>gv

      " move visual block with automatic alignment!
      vnoremap L :m '<-2<CR>gv=gv
      vnoremap N :m '>+1<CR>gv=gv

    " ............................................................ Shift up down

      " see https://github.com/gorkunov/vimconfig.git
      function! s:moveLineOrVisualUpOrDown(move)
        let l:col = virtcol('.')
        execute 'silent! ' . a:move
        execute 'normal! ' . l:col . '|'
      endfunction

      function! s:moveLineOrVisualUp(line_getter, range)
        let l:line = line(a:line_getter)
        if l:line - v:count1 - 1 < 0 | let l:move = '0'
        else                         | let l:move = a:line_getter . ' -' . (v:count1 + 1) | endif
        call <SID>moveLineOrVisualUpOrDown(a:range . 'move ' . l:move)
      endfunction

      function! s:moveLineOrVisualDown(line_getter, range)
        let l:line = line(a:line_getter)
        if l:line + v:count1 > line('$') | let l:move = '$'
        else                             | let l:move = a:line_getter . ' +' . v:count1 | endif
        call <SID>moveLineOrVisualUpOrDown(a:range . 'move ' . l:move)
      endfunction

      function! s:moveLineUp()
        call <SID>moveLineOrVisualUp('.', '')
      endfunction

      function! s:moveLineDown()
        call <SID>moveLineOrVisualDown('.', '')
      endfunction

      function! s:moveVisualUp()
        call <SID>moveLineOrVisualUp("'<", "'<,'>")
        normal! gv
      endfunction

      function! s:moveVisualDown()
        call <SID>moveLineOrVisualDown("'>", "'<,'>")
        normal! gv
      endfunction

      nmap <silent><S-Up>   :call <SID>moveLineUp()<CR>
      imap <silent><S-Up>   <ESC>:call <SID>moveLineUp()<CR>a
      vmap <silent><S-Up>   <ESC>:call <SID>moveVisualUp()<CR>
      nmap <silent><S-Down> :call <SID>moveLineDown()<CR>
      imap <silent><S-Down> <ESC>:call <SID>moveLineDown()<CR>a
      vmap <silent><S-Down> <ESC>:call <SID>moveVisualDown()<CR>

  " Text manipulation ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " ...................................................... Reformat paragraghs

      " retain cursor position for insert mode reformatting
      inoremap <silent><C-r> <Esc>lmZ{jv}kJvgq`Z:delmarks Z<CR>i
      vnoremap <C-r>         lmZJvgq`Z:delmarks Z<CR>i
      " reformat at cursor position
      nnoremap <C-r>         lmZ{jv}kJvgq`Z:delmarks Z<CR>
      inoremap <silent><F5>  <Esc>lmZ{jv}kJvgq`Z:delmarks Z<CR>
      " otherwise advance cursor to next paragraph
      nnoremap <F5>          {jv}kJvgq}}{j
      vnoremap <F5>          Jvgqj

    " ............................................................. Convert tabs

      :command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
      :command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

      nmap <silent><leader><tab>        :silent retab<CR>
      nmap <silent><leader><Space><tab> :silent Space2Tab<CR>
      vmap <silent><leader><Space><tab> :silent Space2Tab<CR>
      nmap <silent><leader><tab><Space> :silent Tab2Space<CR>
      vmap <silent><leader><tab><Space> :silent Tab2Space<CR>

    " .................................................. Quote enclose selection

      " extend enclosing %V 1 char right to enclose last character of block
      vnoremap ' :s/\%V\(.*\%V.\)/'\1'/<CR>:noh<CR>`>l
      vnoremap " :s/\%V\(.*\%V.\)/"\1"/<CR>:noh<CR>`>l

    " ......................................................... CSS sort (align)

      " note <C-v><keycode> to embed command mode keycode
      nmap <silent><leader>css :g/{/normal! f{viB:sort<C-v><CR><CR>
      nmap <silent><leader>cSS :g/{/normal! f{viB:EasyAlign<C-v><CR><C-v><Space><CR>
      nmap <silent><leader>CSS :g/{/normal! f{viB:sort<C-v><CR><CR>:g/{/normal! f{viB:EasyAlign<C-v><CR><C-v><Space><CR>

" edit.vim
