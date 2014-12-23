let s:unite_kind = {
      \ "name": "precure",
      \ "default_action": "name",
      \ "action_table": {
      \     "name": { "description": "Insert <precure_name> / <human_name>" },
      \     "human_name": { "description": "Insert <human_name>" },
      \     "precure_name": { "description": "Insert <precure_name>" },
      \     "attack": { "description": "Insert <attack_message>" },
      \     "transform": { "description": "Insert <transform_message>" },
      \   },
      \ }

function! s:unite_kind.action_table.name.func(candidate)
  call append(line('.'),  a:candidate.source__name)
endfunction

function! s:unite_kind.action_table.human_name.func(candidate)
  call append(line('.'),  a:candidate.source__human_name)
endfunction

function! s:unite_kind.action_table.precure_name.func(candidate)
  call append(line('.'),  a:candidate.source__precure_name)
endfunction

function! s:unite_kind.action_table.attack.func(candidate)
  call append(line('.'),  a:candidate.source__attack)
endfunction

function! s:unite_kind.action_table.transform.func(candidate)
  call append(line('.'),  a:candidate.source__transform)
endfunction

function! unite#kinds#precure#define()
  return s:unite_kind
endfunction
