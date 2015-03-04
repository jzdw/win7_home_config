
"set t_Co =  256
"set background = dark
colorscheme ir_black

"set windows fonts
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    "set guifont=Lucida_Sans_Typewriter:h14:cANSI
    set guifont=Lucida_Sans_Typewriter:h14
  endif
endif
"get rid of menu and tools bars
set guioptions-=m
set guioptions-=T

syntax on
set more

"wrapping
set nowrap
"set linebreak

"status line
set showcmd
set ruler

"misc settings
set backspace=indent,eol,start
set matchpairs+=<:>


" Indenting *******************************************************************
"set ai " Automatically set the indent of a new line (local to buffer)
"set si " smartindent (local to buffer)
set pastetoggle=<F2>   "whether autoindent when pasting codes


" turning on/off invisible characters
" set list, set nolist, set list! to toggle. 
" use \l to toggle the list/nolist
nmap <leader>l :set list!<CR>  
" change list charcters, use ¬ for new line and ▸ for tab and 
" ctrl-v u00ac  in insert mode can put in unicode characters
" ctrl-v u25b8
" set listchars=tab:▸\ ,eol:¬

" tab configurations 
" tabstop       the width of tab charater
" expandtab     when enabled, it would use space to replace tab
" softtabstop   fine tune the space characters to be inserted
" shiftwidth    determines the number of spaces to be inserted/removed using indentation commands in normal mode
" set it such that no tab would be used, all spaces and tab move would be 4 spaces move
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth =4

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction
nmap <C-S-Tab> :call SummarizeTabs()<CR>
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts 
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    end
  finally
    echohl None
  endtry
endfunction


