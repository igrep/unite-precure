let s:script_dir = expand('<sfile>:p:h')

let s:unite_source = {
      \ "name": "precure",
      \ }

let s:precures = []

function! s:unite_source.gather_candidates(args, context)
  " set precure data to s:precures by this script.
  execute 'rubyfile' s:script_dir . '/collect_precures.rb'

  return s:precures
endfunction

function! unite#sources#precure#define()
  return s:unite_source
endfunction
