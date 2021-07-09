# Import colorschemes from `wal` asynchronously
(cat ~/.cache/wal/sequences &)
# persist colorscheme after terminal reset
alias reset='reset; cat ~/.cache/wal/sequences'