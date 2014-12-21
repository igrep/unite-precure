let s:script_dir = expand('<sfile>:p:h')

let s:unite_source = {
      \ "name": "precure",
      \ }

function! s:unite_source.gather_candidates(args, context)
let l:precures = []

  " set precure data to l:precures by this script.
  execute 'rubyfile' s:script_dir . '/collect_precures.rb'

  return l:precures
endfunction

function! unite#sources#precure#define()
  return s:unite_source
endfunction
