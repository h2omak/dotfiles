" sdothum - 2016 (c) wtfpl

" Heading
" ══════════════════════════════════════════════════════════════════════════════

  " Heading styles _____________________________________________________________

    " .................................................................... Setup

      if exists("g:loaded_heading") | finish | endif
      let g:loaded_heading = 1
      let s:save_cpo       = &cpo
      set cpo&vim

      if ! exists('g:leader') | let g:leader = ',' | endif
      let g:under      = '_'
      let g:bullet     = '·' " U+00b7
      let g:dot        = '.'
      let g:equal      = '═' " U+2550
      let g:hyphen     = '─' " U+2500
      let g:underscore = '_'

    " ................................................................ Underline

      " example: draw underline
      " ═══════════════════════
      execute 'imap <silent>' . g:under . g:under . '.' "<C-o>:silent call heading#Underline(g:bullet)<CR>"
      execute 'nmap <silent>' . g:under . g:under . '.' ":silent call heading#Underline(g:bullet)<CR>"
      execute 'imap <silent>' . g:under . g:under . '-' "<C-o>:silent call heading#Underline(g:equal)<CR>"
      execute 'nmap <silent>' . g:under . g:under . '-' ":silent call heading#Underline(g:equal)<CR>"

    " .................................................................... Ruler

      " example: draw ruler
      " ════════════════════════════════════════════════════════════════════════
      execute 'imap <silent>' . g:under . g:under . '..' "<C-o>:silent call heading#Drawline(g:bullet)<CR>"
      execute 'nmap <silent>' . g:under . g:under . '..' ":silent call heading#Drawline(g:bullet)<CR>"
      execute 'imap <silent>' . g:under . g:under . '--' "<C-o>:silent call heading#Drawline(g:equal)<CR>"
      execute 'nmap <silent>' . g:under . g:under . '--' ":silent call heading#Drawline(g:equal)<CR>"

    " .................................................................. Trailer

      " example: append trailer ................................................

      execute 'imap <silent>' . g:leader . '..' "<C-o>:silent call heading#AppendTrailer(g:dot)<CR>"
      execute 'nmap <silent>' . g:leader . '..' ":silent call heading#AppendTrailer(g:dot)<CR>"
      execute 'imap <silent>' . g:leader . '--' "<C-o>:silent call heading#AppendTrailer(g:underscore)<CR>"
      execute 'nmap <silent>' . g:leader . '--' ":silent call heading#AppendTrailer(g:underscore)<CR>"

      execute 'imap <silent>' . g:leader . '??' "<C-o>:call heading#InputTrailer()<CR>"
      execute 'nmap <silent>' . g:leader . '??' ":call heading#InputTrailer()<CR>"

    " ................................................................... Leader

      " ................................................. example: insert leader

      execute 'imap <silent>' . g:leader . '.' "<C-o>:silent call heading#InsertLeader(g:dot)<CR>"
      execute 'nmap <silent>' . g:leader . '.' ":silent call heading#InsertLeader(g:dot)<CR>"
      execute 'imap <silent>' . g:leader . '-' "<C-o>:silent call heading#InsertLeader(g:underscore)<CR>"
      execute 'nmap <silent>' . g:leader . '-' ":silent call heading#InsertLeader(g:underscore)<CR>"

      execute 'imap <silent>' . g:leader . '?' "<C-o>:call heading#InputLeader()<CR>"
      execute 'nmap <silent>' . g:leader . '?' ":call heading#InputLeader()<CR>"

    " .................................................................. Justify

      "                                                   example: right justify

      execute 'imap <silent>' . g:leader . "<Right>" "<C-o>:silent call heading#Justify()<CR>"
      execute 'nmap <silent>' . g:leader . "<Right>" ":silent call heading#Justify()<CR>"

      let &cpo = s:save_cpo
      unlet s:save_cpo

" heading.vim
