require 'rubicure'

command_to_set_precures = <<EOS
let l:precures = [ { "word": "ruby", "kind": "common" } ]
EOS

VIM.command(command_to_set_precures)
