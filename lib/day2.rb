module Day2

  class Intcode
    attr_accessor :code

    def initialize(code)
      @code = code
    end

    def run
      i = 0
      while i < code.length do
        subcode = code.drop(i).take(4)
        opcode = opcode(subcode)

        if opcode == nil || opcode == "Error"
          break
        end

        a = code[subcode[1]]
        b = code[subcode[2]]

        total = a.public_send(opcode, b)

        code[subcode[3]] = total

        i += 4
      end
      code
    end

    def opcode(subcode)
      case subcode[0]
      when 1
        return :+
      when 2
        return :*
      when 99
        return nil
      else return "Error"
      end

    end

    def self.part1
      code = [1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,9,19,1,13,19,23,2,23,9,27,1,6,27,31,
      2,10,31,35,1,6,35,39,2,9,39,43,1,5,43,47,2,47,13,51,2,51,10,55,1,55,5,59,1,59,9,63,
      1,63,9,67,2,6,67,71,1,5,71,75,1,75,6,79,1,6,79,83,1,83,9,87,2,87,10,91,2,91,10,95,
      1,95,5,99,1,99,13,103,2,103,9,107,1,6,107,111,1,111,5,115,1,115,2,119,1,5,119,0,99,2,0,14,0]    

      intcode = Intcode.new(code)
      output = intcode.run[0]
    end

    def self.part2
      expected_output = 19690720
      for noun in 0 ... 99 do
        for verb in 0 ... 99 do
          code = [1,noun,verb,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,9,19,1,13,19,23,2,23,9,27,1,6,27,31,
          2,10,31,35,1,6,35,39,2,9,39,43,1,5,43,47,2,47,13,51,2,51,10,55,1,55,5,59,1,59,9,63,
          1,63,9,67,2,6,67,71,1,5,71,75,1,75,6,79,1,6,79,83,1,83,9,87,2,87,10,91,2,91,10,95,
          1,95,5,99,1,99,13,103,2,103,9,107,1,6,107,111,1,111,5,115,1,115,2,119,1,5,119,0,99,2,0,14,0]    

          intcode = Intcode.new(code)
          output = intcode.run[0]

          if output == expected_output
            return noun * 100 + verb
          end
        end
      end
    end


  end

end
