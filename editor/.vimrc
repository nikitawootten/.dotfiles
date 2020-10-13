" install vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

" ^s save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" paste without formatting
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction

" plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

autocmd FileType tex	noremap <C-P>	:VimtexCompile<CR>
autocmd FileType tex	vnoremap <C-P>	<C-O>:VimtexCompile<CR>
autocmd FileType tex	inoremap <C-P>	<C-O>:VimtexCompile<CR>

Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsSnippetDirectories = ["UltiSnips"]

" vim-plug help
Plug 'junegunn/vim-plug'
call plug#end()

"setlocal spell
"set spelllang=en_us
"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
