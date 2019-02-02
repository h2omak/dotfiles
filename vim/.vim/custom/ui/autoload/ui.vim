" sdothum - 2016 (c) wtfpl

" User Interface
" ══════════════════════════════════════════════════════════════════════════════

  " Layout _____________________________________________________________________

    " .................................................................... Setup

      let s:wikiinfo     = 1 " statusline (0) off (1) on
      let s:initial_view = 1 " prose (0) dfm (1) proof
      let s:info         = 0 " statusline (0) dfm (1) expanded

  "  Distraction free modes ____________________________________________________

    " ................................................................ Code view

      " source code style
      function! s:codeView()
        Trace s:codeView()
        let g:view = 0
        " restore CursorLine syntax highlighting before applying themes
        " syntax enable
        if exists('g:loaded_limelight') | Limelight! | endif
        call theme#Theme()
        call theme#ShowStatusline()
        call theme#CodeView()
        set showmode
      endfunction

    " .................................................... Distraction free view

      " prose style
      function! s:dfmView()
        Trace s:dfmView()
        let g:view = 1
        " silent !tmux set status off
        " un/comment to have monochromatic cursor line (looses vimdiff highlighting)
        call theme#DfmView()
        if core#Prose() || g:ruler == 0 | set colorcolumn=0 | endif
        set foldcolumn=0
        set laststatus=0
        set noshowmode
        set scrolloff=8
        if core#Prose() | set spell
        else            | set nospell | endif
        call <SID>proof()
      endfunction

    " .............................................................. Switch View

      " toggle full document highlight
      function! s:proof()
        Trace s:proof()
        let l:col = virtcol('.')
        call theme#Theme()
        if core#Prose() | call theme#ToggleProof() | endif
        if b:proof == 1
          call <SID>showInfo(1)
          Limelight!
          call theme#Contrast(0)
        else
          call <SID>showInfo(0)
          Limelight
          call theme#Contrast(1)
        endif
        execute 'normal! ' . l:col . '|'
      endfunction

      function! ui#ToggleProof()
        Trace ui#ToggleProof()
        let b:proof = b:proof == 0 ? 1 : 0
        call <SID>proof()
      endfunction

      function! s:setView()
        Trace s:setView()
        if g:view == 0 | call <SID>codeView()
        else           | call <SID>dfmView() | endif
      endfunction

      " toggle dfm view
      function! ui#SwitchView()
        Trace ui#SwitchView()
        let l:col = col('.')
        let g:view = g:view == 0 ? 1 : 0
        call <SID>setView()
        execute 'normal! ' . l:col . '|'
      endfunction

  " Screen focus _______________________________________________________________

    " ........................................................... Screen display

      " initial view
      function! ui#LiteType()
        Trace ui#LiteType()
        call theme#FontSize(core#Prose() ? 1 : 0)
        call theme#Palette()
        if ! exists('b:proof') | let b:proof = s:initial_view | endif
        call <SID>setView()
      endfunction

      " redraw
      function! ui#Retheme()
        Trace ui#Refresh()
        let lstatus     = &laststatus
        call <SID>setView()
        let &laststatus = lstatus
      endfunction

  " Context statusline _________________________________________________________

    " ........................................................ Statusline format

      function! s:detail()
        return (g:detail == 0 ? info#Tag() : info#Atom()) . '  ' . info#SpecialChar()
      endfunction

      " (path) .. filename | pos .. (details)
      function! s:wikiInfo(proof)
        " Trace s:wikiInfo()
        try " trap snippet insertion interruption
          let g:prose = 1
          if core#Prose() && a:proof == 0
            return info#Escape(info#Leader('') . '  %{info#UnModified(0)}%*')
          else
            let l:name     = '%{info#Name()}' . g:pad_inner
            " center dfm indicator / proofing statusline
            if s:info == 0
              let l:leader = '%{info#Leader(info#Name())}'
            else
              let l:path   = '%{info#Path()}'
              let l:leader = '%{info#Leader(info#Path() . g:pad_outer . info#Name())}'
            endif
            let l:name     = '%1*' . l:name
            let l:info     = '%{info#UnModified(1)}' . g:pad_inner . ' ' . '%{info#PosWordsCol()}' " adjust for double byte modifier symbol overlap (with extra space)
            if s:info == 1
              let l:name   = '%2*' . l:path . '%1*' . g:pad_outer . l:name
              let l:info  .= g:pad_outer . '%2*%{<SID>detail()}'
            endif
            return info#Escape('%1*' . l:leader . l:name . l:info . '%1*')
          endif
        catch
        endtry
      endfunction

      function! s:showInfo(proof)
        Trace s:showInfo()
        if s:wikiinfo == 1
          " execute 'set statusline=%{<SID>wikiInfo(' . a:proof . ')}'
          execute 'set statusline=' . <SID>wikiInfo(a:proof)
          call theme#ShowStatusline()
        else
          " simply hide statusline content
          call theme#ShowInfo()
        endif
      endfunction

      function! ui#RefreshInfo()
        Trace ui#RefreshInfo()
        call <SID>showInfo(b:proof)
      endfunction

    " ........................................................ Toggle statusline

      function! ui#ToggleInfo(...)
        Trace ui#ToggleInfo()
        " exiting insert mode? see plugin/ui.vim autocmd
        if a:0 && b:proof == s:initial_view | return | endif
        let l:col = col('.')
        let s:info = (s:info == 0 ? 1 : 0)
        " toggle between writing and proofing modes
        if core#Prose() | call ui#ToggleProof()
        else            | call <SID>showInfo(b:proof) | endif
        execute 'normal! ' . l:col . '|'
      endfunction

" ui.vim
