" Insert IPDB debugger
map <Leader>p :call InsertLine()<CR>
function! InsertLine()
  let trace = expand("import ipdb; ipdb.set_trace()")
  execute "normal o".trace
endfunction
