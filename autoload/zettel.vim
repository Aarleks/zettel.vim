" Build a Zettelkasten with Vim

function! zettel#makeZettel(...)
    " Make a unique filename
    let zettelname = expand('~/Dropbox/Zettelkasten/') . strftime("%F-%H%M") . "-" . join(a:000, '-') . '.md'
    execute "edit " . zettelname
endfunc


function! zettel#ZettelFile()
    execute "Files ~/Dropbox/Zettelkasten"
endfunc
