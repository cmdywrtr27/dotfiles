autocmd Filetype c map <F4> :!gcc -fprofile-arcs -ftest-coverage -Wall -ggdb `find . -type f -name \*.c` -o app<return>

autocmd Filetype c map <F5> :!$TERMINAL -e gdb ./app & <return>

autocmd Filetype c map <F8> :!$TERMINAL -e ./app & <return>

autocmd Filetype cpp map <F2> :!$TERMINAL -e tidy-cpp-proj --app & <return>

autocmd Filetype cpp map <F3> :!cov-cpp-proj --all & <return>

autocmd Filetype cpp map <F4> :!$TERMINAL -e build-cpp-proj --all & <return>

autocmd Filetype cpp map <F5> :!$TERMINAL -e dbg-cpp-proj --app & <return>

autocmd Filetype cpp map <F6> :!$TERMINAL -e dbg-cpp-proj --tests & <return>

autocmd Filetype cpp map <F7> :!$TERMINAL -e memleak-cpp-proj --app & <return>

autocmd Filetype cpp map <F8> :!$TERMINAL -e memleak-cpp-proj --tests & <return>

autocmd Filetype cpp map <F9> :!$TERMINAL -e run-cpp-proj --app & <return>

autocmd Filetype cpp map <F10> :!$TERMINAL -e run-cpp-proj --tests & <return>

autocmd Filetype python map <F6> :!$TERMINAL -e python3 %<return>

set hidden

set nobackup
set nowritebackup

set cmdheight=1

set updatetime=300

set shortmess+=c

set signcolumn=no

inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <leader> rn <Plug>(coc-rename)

nmap <silent> [c <Plug>(coc-diagnostic-prev)

nmap <silent> ]c <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)

nmap <silent> gy <Plug>(coc-type-definition)

nmap <silent> gi <Plug>(coc-implementation)

nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> ? :call <SID>show_documentation()<CR>
function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
execute 'h '.expand('<cword>')
else
call CocAction('doHover')
endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
autocmd!

autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction)

nmap <leader>qf  <Plug>(coc-fix-current)

nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

command! -nargs=0 Format :call CocAction('format')

command! -nargs=? Fold :call     CocAction('fold', <f-args>)

command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>

nnoremap <silent> <space>c  :<C-u>CocList commands<cr>

nnoremap <silent> <space>o  :<C-u>CocList outline<cr>

nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

nnoremap <silent> <space>j  :<C-u>CocNext<CR>

nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
