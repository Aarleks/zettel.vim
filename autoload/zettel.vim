" Build a Zettelkasten with Vim

function! zettel#makeZettel(...)

    " Make a unique filename

    let zettelname = expand('~/Dropbox/Zettelkasten/') . strftime("%F-%H%m") . "-" . join(a:000, '-') . '.md'

    exec "e " . zettelname

endfunc
