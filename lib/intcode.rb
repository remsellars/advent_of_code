class Intcode
  attr_accessor :code, :pointer
  def initialize(code)
    @code = code
    @pointer = 0
  end

  def run
    @pointer = 0

    loop do
      break if @pointer == -1 || @pointer == @code.length
      @pointer = process_instruction
    end

    @code
  end

  # modifies code and moves the pointer along
  def process_instruction()
    opcode = @code[@pointer]
    return -1 if opcode == 99

    case opcode
    when 1
      add(opcode)
      return @pointer + 4
    when 2
      times(opcode)
      return @pointer + 4
    when 3
     # input(opcode)
      return @pointer + 2
    when 4
     # output(opcode)
     @pointer += 2
      return @pointer + 2
    end

  end

  # return the ABC of the opcode (with padded zeros)
  def get_modes(opcode)
    digits = opcode.digits

    while digits.count < 5 do
      digits.unshift(0) # pad 0s
    end

    digits.slice(0, 3) # return just the first three (ABC)
  end

  # Opcode 1
  def add(opcode)
    modes = get_modes(opcode)

    # todo, mode affects whether we are using or changing using the direct value or the pointer.
    a = @code[@pointer + 1]
    b = @code[@pointer + 2]
    res = @code[@pointer + 3]
    @code[res] = @code[a] + @code[b]

  end

  # Opcode 2
  def times(opcode)
    # todo, mode affects whether we are using or changing using the direct value or the pointer.
    a = @code[@pointer + 1]
    b = @code[@pointer + 2]
    res = @code[@pointer + 3]
    @code[res] = @code[a] * @code[b]
  end

  # Opcode 3
  def input(opcode)
  end

  # Opcode 4
  def output(opcode)
  end

end