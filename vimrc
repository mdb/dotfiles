" Load vim-plug
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'kien/rainbow_parentheses.vim'
Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-sleuth'
Plug 'mileszs/ack.vim'

" Disabled; COC seemingly struggles in large monorepos
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Scala
Plug 'derekwyatt/vim-scala'

" Elm
Plug 'andys8/vim-elm-syntax'

" Vue.js
Plug 'posva/vim-vue'

" Typescript
Plug 'leafgarland/typescript-vim'

" Docker
Plug 'ekalinin/Dockerfile.vim'

" Go
Plug 'benmills/vim-golang-alternate'
Plug 'fatih/vim-go'
" Configure vim-go :GoDef behavior a la
" https://github.com/fatih/vim-go/issues/494#issuecomment-124556989
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" make GoDef open in new tab (\dt)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
" alias :GoTestFunc (provided by vim-go) to :Gtf
:command Gtf GoTestFunc

" HCL
Plug 'fatih/vim-hclfmt'
Plug 'b4b4r07/vim-hcl'

" Rego
Plug 'tsandall/vim-rego'

" pug/stylus
Plug 'digitaltoad/vim-pug'
Plug 'wavded/vim-stylus'

" powershell
Plug 'PProvost/vim-ps1'

Plug 'ruanyl/vim-gh-line'

call plug#end()

syntax on

" Go
let g:go_fmt_command = "goimports"
autocmd FileType go set listchars=tab:\ \ ,trail:·,extends:>,precedes:<

" gg=G to reformat ugly XML
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" highlight trailing whitespace
highlight! link ExtraWhitespace Todo
autocmd BufWinEnter,InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufWinLeave * call clearmatches()

" Highlight long rows
highlight OverLength ctermbg=Magenta ctermfg=white guibg=#592929
match OverLength /\%81v./

" 80-column line
set colorcolumn=81
set textwidth=80
highlight! link ColorColumn CursorColumn

" Show dotfiles in NERDTree
let NERDTreeShowHidden=1
" alias :NERDTreeFind (provided by nerdtree) to :Ntf
:command Ntf NERDTreeFind

" tab navigation & creation
" C- represents the Control key
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-n> :tabnew<CR>

" syntax highlighting for non-standard file extensions
au BufNewFile,BufRead *.rhtml set syn=eruby
au BufNewFile,BufRead Rakefile set syn=ruby
au BufNewFile,BufRead Gemfile set syn=ruby
au BufNewFile,BufRead config.ru set syn=ruby
au BufNewFile,BufRead Vagrantfile set syn=ruby
au BufNewFile,BufRead Brewfile set syn=ruby
au BufNewFile,BufRead *.builder set syn=ruby
au BufNewFile,BufRead *.jbuilder set syn=ruby
au BufNewFile,BufRead *.pp set syn=ruby
au BufNewFile,BufRead *.ftl set syn=ftl
au BufNewFile,BufRead *.pde set syn=pde
au BufNewFile,BufRead *.json set syn=javascript
au BufNewFile,BufRead *jshintrc set syn=javascript
au BufNewFile,BufRead *.cjs set syn=javascript
au BufNewFile,BufRead *.bats set syn=sh
au BufNewFile,BufRead *.tfvars set syn=tf
au BufNewFile,BufRead *gitconfig set syn=toml
au BufNewFile,BufRead *.spc set syn=hcl # steampipe configuration files
au BufNewFile,BufRead aliases set syn=sh

" rainbow_parentheses.vim
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
  \ ['lightblue',  'lightblue'],
  \ ['lightgreen', 'lightgreen'],
  \ ['lightred',   'lightred'],
  \ ['darkblue',   'darkblue'],
  \ ['darkgreen',  'darkgreen'],
  \ ['darkred',    'darkred'],
  \ ['blue',       'blue'],
  \ ['green',      'green'],
  \ ['red',        'red'],
  \ ]
let g:rbpt_colorpairs = g:rbpt_colorpairs + g:rbpt_colorpairs
let g:rbpt_max = len(g:rbpt_colorpairs)

" ctrl-p opens in tab
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" ale
let g:ale_echo_msg_format = '[%linter%] %severity% %s'
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier', 'importjs']
let g:ale_linters = {}
let g:ale_linters['go'] = ['go build', 'go vet']
let g:ale_linters['html'] = []
let g:ale_linters['ruby'] = ['ruby']
let g:ale_linters['sh'] = ['shellcheck']
let g:ale_linters['sql'] = ['sqlint']
let g:ale_linters['vim'] = ['vint']

" jump to a matching opening or closing parenthesis, square bracket or a curly brace
noremap % v%

set visualbell
set nowrap
set background=dark
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set number
set showcmd
set ruler
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set list
set mouse=a
set nobackup
set noswapfile

" Searching
set hlsearch
set ignorecase
nmap <silent> ,/ :nohlsearch<CR>

" fzf
set rtp+=/opt/homebrew/bin/fzf
" alias :BCommits (provided by junegunn/fzf.vim) to :Bg
:command Bg BCommits
" alias :Files (provided by junegunn/fzf.vim) to :F
:command F Files

" coc
" 'Ctrl + space' (in insert) opens suggestions
" 'Ctrl + n', etc. navigates and selects suggestions
" 'Esc' closes the suggestion box
" disabled; COC struggles in large monorepos
" inoremap <silent><expr> <c-space> coc#refresh()
