require 'rubicure'

def to_vim_lines multiline_string
  "[#{multiline_string.each_line.map {|l| %Q'"#{l.strip}"' }.join(','.freeze)}]"
end

candidates = Rubicure::Girl.names.map do|name|
  girl = Rubicure::Girl.find name

  r = '{'
  r << %Q'"word": "#{name}",'
  r << %Q'"source__name": "#{girl.precure_name} / #{girl.human_name}",'
  r << %Q'"source__human_name": "#{girl.human_name}",'
  r << %Q'"source__precure_name": "#{girl.precure_name}",'
  r << %Q'"source__attack": #{to_vim_lines girl.attack_messages[1]},'
  r << %Q'"source__transform": #{to_vim_lines girl.transform_message},'
  r << '"kind": "precure",'
  r << '}'.freeze
end

command_to_set_precures = <<EOS
let l:precures = [#{candidates.join ', '.freeze}]
EOS

VIM.command(command_to_set_precures)
