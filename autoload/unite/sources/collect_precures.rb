require 'rubicure'

candidates = Rubicure::Girl.names.map do|name|
  %Q'{ "word": "#{name}", "kind": "common" }'
end

command_to_set_precures = <<EOS
let l:precures = [#{candidates.join ', '.freeze}]
EOS

VIM.command(command_to_set_precures)
