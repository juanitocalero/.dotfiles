function! InsertImage(template)
    " Get the filename from the selected text or the last word before the cursor
    let filename = visualmode() ? @* : expand('<cword>')

    " If no filename is provided, generate a unique name based on the current timestamp
    if filename == ''
        let filename = 'image_' . strftime('%Y%m%d%H%M%S')
    endif

    " Add the .png extension to the filename
    let filename = filename . '.png'

    " Get the current working directory
    let cwd = getcwd()

    " Create the full path to the file
    let filepath = cwd . '/' . filename

    " Call wl-paste with the filepath
    silent execute '!wl-paste -t image > ' . shellescape(filepath)


    " If a template string is provided, replace the placeholders with the filename and filepath
    if a:template != ''
        let output = substitute(a:template, '{filename}', filename, 'g')
        let output = substitute(output, '{filepath}', filepath, 'g')
    else
        " Otherwise, use the filepath as the output
        let output = filepath
    endif

    " If there is a visual selection, replace it with the filename
    if visualmode()
        normal! gvciw
    else
        " Otherwise, replace the last word before the cursor with the filename
        normal! ciw
    endif

    " Insert the output at the current cursor position
    execute "normal! i" . output

endfunction

" Map the key F5 to call the function with an empty template string
nnoremap <F5> :call InsertImage('')<CR>
vnoremap <F5> :call InsertImage('')<CR>

" Map the key F6 to call the function with a Markdown template
nnoremap <F6> :call InsertImage('[{filename}]({filename})')<CR>
vnoremap <F6> :call InsertImage('[{filename}]({filename})')<CR>
