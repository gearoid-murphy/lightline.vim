" =============================================================================
" Filename: plugin/lightline.vim
" Author: itchyny
" License: MIT License
" Last Change: 2019/07/30 12:00:00.
" =============================================================================

if exists('g:loaded_lightline') || v:version < 700
  finish
endif
let g:loaded_lightline = 1

let s:save_cpo = &cpo
set cpo&vim

augroup lightline
  autocmd!
  autocmd FocusGained * call lightline#focus_gained()
  autocmd FocusLost * call lightline#focus_lost()
  autocmd WinEnter,BufEnter,SessionLoadPost * call lightline#update()
  if !has('patch-8.1.1715')
    autocmd FileType qf call lightline#update()
  endif
  autocmd SessionLoadPost * call lightline#highlight()
  autocmd ColorScheme * if !has('vim_starting') || expand('<amatch>') !=# 'macvim'
        \ | call lightline#update() | call lightline#highlight() | endif
  autocmd CursorMoved,BufUnload * call lightline#update_once()
augroup END

" This quickfix option was introduced at Vim 85850f3a5ef9, which is the commit
" just before 8.1.1715. Before this patch, autocmd FileType is required to
" overwrite the statusline of the quickfix and location windows.
let g:qf_disable_statusline = 1

let &cpo = s:save_cpo
unlet s:save_cpo
