#!/usr/bin/ruby

def calculate(oper, op1, op2)
  op1.send(oper, op2)
end

def operate (result, index)
  opcode = result[index].to_i
  pos1 = result[index+1].to_i
  pos2 = result[index+2].to_i
  output_pos = result[index+3].to_i

  case opcode
  when 1
    result[output_pos] = calculate(:+, result[pos1].to_i, result[pos2].to_i)
  when 2
    result[output_pos] = calculate(:*, result[pos1].to_i, result[pos2].to_i)
  else
    puts result[0]
    exit(true)
  end

end

def walk_through(result)
  (0..result.length-1).step(4).each do |i|
    operate(result, i)
  end

  result
end

def read_input(filename)
  file = File.open(filename)
  file.read.split(",")
end

def replace_pos(result)
  result[1] = "12"
  result[2] = "2"
  result
end

output(walk_through(replace_pos(read_input("input.txt"))))

