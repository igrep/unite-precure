require 'rubicure'

candidates = Rubicure::Girl.uniq_names.map do|name|
  r = '{'
  r << %Q'"word": "#{name}",'
  r << '"kind": "common",'
  r << '}'.freeze
end

command_to_set_precures = <<EOS
let l:precures = [#{candidates.join ', '.freeze}]
EOS

VIM.command(command_to_set_precures)
