" Vundle
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

syntax on

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
set ttymouse=xterm2
set mouse=a
set nobackup
set noswapfile

" Searching
set hlsearch
set ignorecase
nmap <silent> ,/ :nohlsearch<CR>

" highlight trailing whitespace
highlight! link ExtraWhitespace Todo
autocmd BufWinEnter,InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufWinLeave * call clearmatches()

" Highlight long rows
highlight OverLength ctermbg=Magenta ctermfg=white guibg=#592929
match OverLength /\%81v./

map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-n> :tabnew<CR>

" CTRL-P opens in tab
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

au BufNewFile,BufRead *.rhtml set syn=eruby
au BufNewFile,BufRead *.ftl set syn=ftl
au BufNewFile,BufRead *.pde set syn=pde
au BufNewFile,BufRead Rakefile set syn=ruby
au BufNewFile,BufRead Gemfile set syn=ruby
au BufNewFile,BufRead config.ru set syn=ruby
au BufNewFile,BufRead Vagrantfile set syn=ruby
au BufNewFile,BufRead *.builder set syn=ruby
au BufNewFile,BufRead *.jbuilder set syn=ruby
au BufNewFile,BufRead *.pp set syn=ruby
au BufNewFile,BufRead *.json set syn=javascript
