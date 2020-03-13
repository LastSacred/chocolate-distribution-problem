class ChocolateDistributor
  attr_accessor :input, :test_cases, :min_diffs 

  def distribute_chocolate(input)
    self.input = input
    parse_test_cases
    find_min_diffs
    format_output
  end

  private

  def parse_test_cases
    input_array = input.split("\n")
    input_array.shift.to_i
    test_cases = []
  
    until input_array.count == 0
      test_case_strings = input_array.shift(3)
      packets = test_case_strings[1].split(" ").map { |n| n.to_i }
      students_count = test_case_strings[2].to_i
      test_cases << {packets: packets, student_count: students_count}
    end
  
    self.test_cases = test_cases
  end
  
  def format_output
    min_diffs.join("\n")
  end
  
  def find_min_diffs
    self.min_diffs = test_cases.map do |test_case|
      packets = test_case[:packets].sort
      student_count = test_case[:student_count]
      last_packet = student_count - 1
      
      step = 0
      until student_count + step > packets.count
        diff = packets[last_packet + step] - packets[step]
        min_diff = diff if !min_diff || diff < min_diff
        step += 1
      end
  
      min_diff
    end
  end
end